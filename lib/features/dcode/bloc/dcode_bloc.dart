import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:remove_emoji/remove_emoji.dart';

part 'dcode_event.dart';
part 'dcode_state.dart';

class DcodeBloc extends Bloc<DcodeEvent, DcodeState> {
  String encoded = '';
  String decoded = '';

  DcodeBloc() : super(DcodeInitial());

  @override
  Stream<DcodeState> mapEventToState(
    DcodeEvent event,
  ) async* {
    if (event is GetBinaryFromString) {
      encoded = convertStringToBinary(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromBinary) {
      decoded = convertBinaryToString(event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetAsciiFromString) {
      encoded = convertStringToAscii(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromAscii) {
      decoded = convertAsciiToString(event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetHexFromString) {
      encoded = convertStringToHex(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromHex) {
      decoded = convertHexToString(event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetOctalFromString) {
      encoded = convertStringToOctal(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromOctal) {
      decoded = convertOctalToString(event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetReversedLettersFromString) {
      encoded = reversLetters(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromReversedLetters) {
      decoded = reversLetters(event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetReversedWordsFromString) {
      encoded = reversWords(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromReversedWords) {
      decoded = reversWords(event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetCapitalizedSentenseFromString) {
      encoded = capitalizeSentence(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromCapitalizedSentense) {
      decoded = event.textString;
      yield Decoded(decoded: decoded);
    } else if (event is GetCapitalizedWordsFromString) {
      encoded = capitalizeWord(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromCapitalizedWords) {
      decoded = event.textString;
      yield Decoded(decoded: decoded);
    } else if (event is GetUpperCasedFromString) {
      encoded = convertStringToUpperCase(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromUpperCased) {
      decoded = event.textString;
      yield Decoded(decoded: decoded);
    } else if (event is GetLowerCasedFromString) {
      encoded = convertStringToLowerCase(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromLowerCased) {
      decoded = event.textString;
      yield Decoded(decoded: decoded);
    } else if (event is GetUpsideDown) {
      encoded = upsideDown(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetUpsideDownNormal) {
      decoded = upsideDownToNormal(event.textString);
      yield Decoded(decoded: decoded);
    } else if (event is GetRandomCaseFromString) {
      encoded = randomCase(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromRandomCase) {
      decoded = randomCase(event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetBase64EncodeString) {
      encoded = base64EncodeString(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetBase64DecodeString) {
      decoded = base64DecodeString(event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetMorseFromString) {
      encoded = converteMorse(event.textString, false);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromMorse) {
      decoded = converteMorse(event.textString, true);

      yield Decoded(decoded: decoded);
    } else if (event is GetNatoFromString) {
      encoded = convertNato(event.textString, false);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromNato) {
      decoded = convertNato(event.textString, true);

      yield Decoded(decoded: decoded);
    } else if (event is GetZalgoMiniFromString) {
      encoded = convertZalgo(input: event.textString, zalgoOptMini: true);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromZalgoMini) {
      decoded = convertZalgo(input: event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetZalgoNormalFromString) {
      encoded = convertZalgo(input: event.textString, zalgoOptNormal: true);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromZalgoNormal) {
      decoded = convertZalgo(input: event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetZalgoMaxiFromString) {
      encoded = convertZalgo(input: event.textString, zalgoOptMaxi: true);

      yield Encoded(encoded: encoded);
    } else if (event is GetStringFromZalgoMaxi) {
      decoded = convertZalgo(input: event.textString);

      yield Decoded(decoded: decoded);
    } else if (event is GetSha1FromString) {
      encoded = getSha1Hash(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetSha224FromString) {
      encoded = getSha224Hash(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetSha256FromString) {
      encoded = getSha256Hash(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetSha384FromString) {
      encoded = getSha384Hash(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetSha512FromString) {
      encoded = getSha512Hash(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is GetMd5FromString) {
      encoded = getMd5Hash(event.textString);

      yield Encoded(encoded: encoded);
    } else if (event is ClearEncoded) {
      encoded = '';

      yield Encoded(encoded: encoded);
    } else if (event is ClearDecoded) {
      decoded = '';

      yield Decoded(decoded: decoded);
    }
  }
}

//-------------------------------<< TEXT CONVERSION FUNCTIONS >>-------------------------------

bool _isUtf16Surrogate(int value) {
  return value & 0xF800 == 0xD800;
}

//-------------------------------------------------------------------------------

String convertStringToBinary(String input) {
  return Utf8Encoder().convert(input).map((aChar) {
    return aChar.toRadixString(2).padLeft(8, '0');
  }).join(' ');
}

String convertBinaryToString(String input) {
  //REVIEW fix conversion to bin.
  final x = input
      .split(' ')
      .map(
        (bin) => int.parse(bin, radix: 2),
      )
      .map((code) {
    if (_isUtf16Surrogate(code)) {
      return '';
    } else {
      return String.fromCharCode(code);
    }
  }).join();
  return x;
}

String convertStringToAscii(String input) {
  try {
    return input
        .split('')
        .map((char) => Utf8Encoder().convert(char).join())
        .join(' ');
  } catch (e) {
    return '';
  }
}

String convertAsciiToString(String input) {
  try {
    return input.split(' ').map((charCode) {
      if (_isUtf16Surrogate(int.parse(charCode))) {
        return '';
      } else {
        return String.fromCharCode(int.parse(charCode));
      }
    }).join();
  } catch (e) {
    return '';
  }
}

String convertStringToHex(String input) {
  try {
    return Utf8Encoder()
        .convert(input)
        .map((aChar) => aChar.toRadixString(16))
        .join(' ');
  } catch (e) {
    return '';
  }
}

//convert base 16 or hex to String

String convertHexToString(String input) {
  try {
    return input
        .split(' ')
        .map((binary) => int.parse(binary.toString(), radix: 16))
        .map(
      (charCode) {
        if (_isUtf16Surrogate(charCode)) {
          return '';
        } else {
          return String.fromCharCode(charCode);
        }
      },
    ).join();
  } catch (e) {
    return '';
  }
}

//convert text to octal base8
String convertStringToOctal(String input) {
  try {
    return Utf8Encoder()
        .convert(input)
        .map((aChar) => aChar.toRadixString(8))
        .join(' ');
  } catch (e) {
    return '';
  }
}

String convertOctalToString(String input) {
  try {
    return input
        .split(' ')
        .map((binary) => int.parse(binary.toString(), radix: 8))
        .map(
      (charCode) {
        if (_isUtf16Surrogate(charCode)) {
          return '';
        } else {
          return String.fromCharCode(charCode);
        }
      },
    ).join();
  } catch (e) {
    return '';
  }
}

String convertStringToUpperCase(String input) {
  try {
    return input.toUpperCase();
  } catch (e) {
    return '';
  }
}

String convertStringToLowerCase(String input) {
  try {
    return input.toLowerCase();
  } catch (e) {
    return '';
  }
}

String reversLetters(String input) {
  try {
    return String.fromCharCodes(input.runes.toList().reversed);
  } catch (e) {
    return '';
  }
}

String reversWords(String input) {
  try {
    return input.split(' ').reversed.join(' ');
  } catch (e) {
    return '';
  }
}

String upsideDown(String input) {
  final removedEmojie = RemoveEmoji().removemoji(input);

  // //safty check:
  // final filtr = Utf8Codec()
  //     .encoder
  //     .convert(removedEmojie)
  //     .map((charCode) => String.fromCharCode(charCode))
  //     .join();

  try {
    var normal = "abcdefghijklmnopqrstuvwxyz&.,[](){}?!'\"<>_\"\\;`‿⁅∴";
    var split = "ɐqɔpǝɟbɥıɾʞןɯuodbɹsʇnʌʍxʎz⅋˙'][)(}{¿¡,„><‾„/؛,⁀⁆∵";
    //maj
    normal += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    split += '∀qϽᗡƎℲƃHIſʞ˥WNOԀὉᴚS⊥∩ΛMXʎZ';
    //number
    normal += '0123456789';
    split += '0ƖᄅƐㄣϛ9ㄥ86';

    var newstr = '';

    String letter;

    for (var i in removedEmojie.split('')) {
      letter = i;

      var a = normal.indexOf(letter);
      newstr += (a != -1) ? split[a] : letter;
    }

    return newstr.split('').reversed.join('');
  } catch (e) {
    return '';
  }
}

String upsideDownToNormal(String input) {
  final removedEmojie = RemoveEmoji().removemoji(input);

  try {
    var normal = "abcdefghijklmnopqrstuvwxyz&.,[](){}?!'\"<>_\"\\;`‿⁅∴";
    var split = "ɐqɔpǝɟbɥıɾʞןɯuodbɹsʇnʌʍxʎz⅋˙'][)(}{¿¡,„><‾„/؛,⁀⁆∵";
    //maj
    normal += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    split += '∀qϽᗡƎℲƃHIſʞ˥WNOԀὉᴚS⊥∩ΛMXʎZ';
    //number
    normal += '0123456789';
    split += '0ƖᄅƐㄣϛ9ㄥ86';

    var newstr = '';

    String letter;

    for (var i in removedEmojie.split('')) {
      letter = i;

      var a = split.indexOf(letter);
      newstr += (a != -1) ? normal[a] : letter;
    }

    return newstr.split('').reversed.join('');
  } catch (e) {
    return '';
  }
}

String randomCase(String input) {
  try {
    var randX = '';
    for (var i in input.split('')) {
      final random = Random();
      final r = random.nextBool();
      randX += r ? i.toUpperCase() : i.toLowerCase();
    }
    return randX;
  } catch (e) {
    return '';
  }
}

String capitalizeSentence(String input) {
  try {
    final stringBuffer = StringBuffer();

    var capitalize = true;
    for (final letter in input.toLowerCase().codeUnits) {
      // UTF-16: A-Z => 65-90, a-z => 97-122.
      if (capitalize && letter >= 97 && letter <= 122) {
        stringBuffer.writeCharCode(letter - 32);
        capitalize = false;
      } else {
        stringBuffer.writeCharCode(letter);
      }
    }

    return stringBuffer.toString().trim();
  } catch (e) {
    return '';
  }
}

String capitalizeWord(String input) {
  try {
    final stringBuffer = StringBuffer();

    var capitalizeNext = true;
    for (final letter in input.toLowerCase().codeUnits) {
      // UTF-16: A-Z => 65-90, a-z => 97-122.
      if (capitalizeNext && letter >= 97 && letter <= 122) {
        stringBuffer.writeCharCode(letter - 32);
        capitalizeNext = false;
      } else {
        // UTF-16: 32 == space, 46 == period, 10 == new line
        if (letter == 32 || letter == 46 || letter == 10) capitalizeNext = true;
        stringBuffer.writeCharCode(letter);
      }
    }

    return stringBuffer.toString().trim();
  } catch (e) {
    return '';
  }
}

String base64EncodeString(String input) {
  try {
    final encoded = input
        .split('')
        .map((char) => int.parse(char.codeUnits.join()))
        .toList();
    return Base64Encoder().convert(encoded);
  } catch (e) {
    return '';
  }
}

String base64DecodeString(String input) {
  try {
    return Base64Decoder()
        .convert(input)
        .join(' ')
        .split(' ')
        .map((charCode) => String.fromCharCode(int.parse(charCode)))
        .join();
  } catch (e) {
    return '';
  }
}

String converteMorse(String input, bool isMorse) {

  

  final Map<String, String> _morse = {
    '': '⍰',
    ' ': '/',
    'a': '.-',
    'b': '-...',
    'c': '-.-.',
    'd': '-..',
    'e': '.',
    'f': '..-.',
    'g': '--.',
    'h': '....',
    'i': '..',
    'j': '.---',
    'k': '-.-',
    'l': '.-..',
    'm': '--',
    'n': '-.',
    'o': '---',
    'p': '.--.',
    'q': '--.-',
    'r': '.-.',
    's': '...',
    't': '-',
    'u': '..-',
    'v': '...-',
    'w': '.--',
    'x': '-..-',
    'y': '-.--',
    'z': '--..',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
    '0': '-----',
    '!': '-.-.--',
    '?': '..--..',
    '@': '.--.-.',
    '=': '-...-',
    '&': '.-...',
    '(': '-.--.',
    ')': '-.--.-',
    '-': '-....-',
    '_': '..--.-',
    '+': '.-.-.',
    ';': '-.-.-.',
    ':': '---...',
    '\$': '...-..-',
    '\'': '.----.',
    '\"': '.-..-.',
    ',': '--..--',
    '.': '.-.-.-',
    '/': '-..-.',
    'À': '.--.-',
    'Å': '.--.-',
    'Ä': '.-.-',
    'Ą': '.-.-',
    'Æ': '.-.-',
    'Ć': '-.-..',
    'Ĉ': '-.-..',
    'Ç': '-.-..',
    'Đ': '..-..',
    'Ð': '..--.',
    'É': '..-..',
    'È': '.-..-',
    'Ę': '..-..',
    'Ĝ': '--.-.',
    'Ĥ': '----',
    'Ĵ': '.---.',
    'Ł': '.-..-',
    'Ń': '--.--',
    'Ñ': '--.--',
    'Ó': '---.',
    'Ö': '---.',
    'Ø': '---.',
    'Ś': '...-...',
    'Ŝ': '...-.',
    'Š': '----',
    'Þ': '.--..',
    'Ü': '..--',
    'Ŭ': '..--',
    'Ź': '--..-.',
    'Ż': '--..-',
  };

  String _cipherLetter(String letter, bool isMorse) {
    var l = (isMorse) ? '' : '';
    _morse.forEach((mapLetter, code) {
      final check = (isMorse) ? code : mapLetter;
      final retrieve = (isMorse) ? mapLetter : code;
      if (letter.toLowerCase() == check.toLowerCase()) {
        l = retrieve;
      }
    });
    final _return = (isMorse) ? l.toLowerCase() : l;
    return _return;
  }

  String _cipherMessage(String message, bool isMorse) {
    return message
        .trim()
        .split((isMorse) ? ' ' : '')
        .map((letter) => _cipherLetter(letter, isMorse))
        .join((isMorse) ? '' : ' ');
  }

  String _cipher(bool isNull, bool isMorse, String message) {
    final string = (isNull) ? '' : message;
    return _cipherMessage(string.toLowerCase(), isMorse);
  }

  try {
    return _cipher(input == null, isMorse, input);
  } catch (e) {
    return '';
  }
}

String convertNato(String input, bool isNato) {
  final Map<String, String> _nato = {
    '': '⍰',
    ' ': '(space)',
    'a': 'Alpha',
    'b': 'Bravo',
    'c': 'Charlie',
    'd': 'Delta',
    'e': 'Echo',
    'f': 'Foxtrot',
    'g': 'Golf',
    'h': 'Hotel',
    'i': 'India',
    'j': 'Juliet',
    'k': 'Kilo',
    'l': 'Lima',
    'm': 'Mike',
    'n': 'November',
    'o': 'Oscar',
    'p': 'Papa',
    'q': 'Quebec',
    'r': 'Romeo',
    's': 'Sierra',
    't': 'Tango',
    'u': 'Uniform',
    'v': 'Victor',
    'w': 'Whiskey',
    'x': 'X-ray',
    'y': 'Tankee',
    'z': 'Zulu',
    '1': 'One',
    '2': 'Two',
    '3': 'Three',
    '4': 'Four',
    '5': 'Five',
    '6': 'Six',
    '7': 'Seven',
    '8': 'Eight',
    '9': 'Nine',
    '0': 'Zero',
    '-': 'Dash',
    '.': '(Period)',
  };

  String _cipherLetter(String letter, bool isNato) {
    var l = (isNato) ? '' : '';
    _nato.forEach((mapLetter, code) {
      final check = (isNato) ? code : mapLetter;
      final retrieve = (isNato) ? mapLetter : code;
      if (letter.toLowerCase() == check.toLowerCase()) {
        l = retrieve;
      }
    });
    final _return = (isNato) ? l.toLowerCase() : l;
    return _return;
  }

  String _cipherMessage(String message, bool isNato) {
    return message
        .split((isNato) ? ' ' : '')
        .map((letter) => _cipherLetter(letter, isNato))
        .join((isNato) ? '' : ' ');
  }

  String _cipher(bool isNull, bool isNato, String message) {
    final string = (isNull) ? '' : message;
    return _cipherMessage(string.toLowerCase(), isNato);
  }

  try {
    return _cipher(input == null, isNato, input);
  } catch (e) {
    return '';
  }
}

String convertZalgo({
  String input,
  bool zalgoOptMini = false,
  bool zalgoOptNormal = false,
  bool zalgoOptMaxi = false,
  bool up = true,
  bool down = true,
  bool mid = true,
}) {
  final removedEmojie = RemoveEmoji().removemoji(input);

  

  

  const zalgo_up = [
    '\u030d',
    /*     Ì     */ '\u030e',
    /*     ÌŽ     */ '\u0304',
    /*     Ì„     */ '\u0305',
    /*     Ì…     */
    '\u033f',
    /*     Ì¿     */ '\u0311',
    /*     Ì‘     */ '\u0306',
    /*     Ì†     */ '\u0310',
    /*     Ì     */
    '\u0352',
    /*     Í’     */ '\u0357',
    /*     Í—     */ '\u0351',
    /*     Í‘     */ '\u0307',
    /*     Ì‡     */
    '\u0308',
    /*     Ìˆ     */ '\u030a',
    /*     ÌŠ     */ '\u0342',
    /*     Í‚     */ '\u0343',
    /*     Ì“     */
    '\u0344',
    /*     ÌˆÌ   */ '\u034a',
    /*     ÍŠ     */ '\u034b',
    /*     Í‹     */ '\u034c',
    /*     ÍŒ     */
    '\u0303',
    /*     Ìƒ     */ '\u0302',
    /*     Ì‚     */ '\u030c',
    /*     ÌŒ     */ '\u0350',
    /*     Í     */
    '\u0300',
    /*     Ì€     */ '\u0301',
    /*     Ì     */ '\u030b',
    /*     Ì‹     */ '\u030f',
    /*     Ì     */
    '\u0312',
    /*     Ì’     */ '\u0313',
    /*     Ì“     */ '\u0314',
    /*     Ì”     */ '\u033d',
    /*     Ì½     */
    '\u0309',
    /*     Ì‰     */ '\u0363',
    /*     Í£     */ '\u0364',
    /*     Í¤     */ '\u0365',
    /*     Í¥     */
    '\u0366',
    /*     Í¦     */ '\u0367',
    /*     Í§     */ '\u0368',
    /*     Í¨     */ '\u0369',
    /*     Í©     */
    '\u036a',
    /*     Íª     */ '\u036b',
    /*     Í«     */ '\u036c',
    /*     Í¬     */ '\u036d',
    /*     Í­     */
    '\u036e',
    /*     Í®     */ '\u036f',
    /*     Í¯     */ '\u033e',
    /*     Ì¾     */ '\u035b',
    /*     Í›     */
    '\u0346',
    /*     Í†     */ '\u031a' /*     Ìš     */
  ];

  //those go DOWN
  const zalgo_down = [
    '\u0316',
    /*     Ì–     */ '\u0317',
    /*     Ì—     */ '\u0318',
    /*     Ì˜     */ '\u0319',
    /*     Ì™     */
    '\u031c',
    /*     Ìœ     */ '\u031d',
    /*     Ì     */ '\u031e',
    /*     Ìž     */ '\u031f',
    /*     ÌŸ     */
    '\u0320',
    /*     Ì      */ '\u0324',
    /*     Ì¤     */ '\u0325',
    /*     Ì¥     */ '\u0326',
    /*     Ì¦     */
    '\u0329',
    /*     Ì©     */ '\u032a',
    /*     Ìª     */ '\u032b',
    /*     Ì«     */ '\u032c',
    /*     Ì¬     */
    '\u032d',
    /*     Ì­      */ '\u032e',
    /*     Ì®     */ '\u032f',
    /*     Ì¯      */ '\u0330',
    /*     Ì°     */
    '\u0331',
    /*     Ì±     */ '\u0332',
    /*     Ì²     */ '\u0333',
    /*     Ì³     */ '\u0339',
    /*     Ì¹     */
    '\u033a',
    /*     Ìº     */ '\u033b',
    /*     Ì»     */ '\u033c',
    /*     Ì¼     */ '\u0345',
    /*     Í…     */
    '\u0347',
    /*     Í‡     */ '\u0348',
    /*     Íˆ     */ '\u0349',
    /*     Í‰     */ '\u034d',
    /*     Í     */
    '\u034e',
    /*     ÍŽ     */ '\u0353',
    /*     Í“     */ '\u0354',
    /*     Í”     */ '\u0355',
    /*     Í•     */
    '\u0356',
    /*     Í–     */ '\u0359',
    /*     Í™     */ '\u035a',
    /*     Íš     */ '\u0323' /*     Ì£     */
  ];

  //those always stay in the middle
  const zalgo_mid = [
    '\u0315',
    /*     Ì•     */ '\u031b',
    /*     Ì›     */ '\u0340',
    /*     Ì€     */ '\u0341',
    /*     Ì     */
    '\u0358',
    /*     Í˜     */ '\u0321',
    /*     Ì¡     */ '\u0322',
    /*     Ì¢     */ '\u0327',
    /*     Ì§     */
    '\u0328',
    /*     Ì¨     */ '\u0334',
    /*     Ì´     */ '\u0335',
    /*     Ìµ     */ '\u0336',
    /*     Ì¶     */
    '\u034f',
    /*     Í     */ '\u035c',
    /*     Íœ     */ '\u035d',
    /*     Í     */ '\u035e',
    /*     Íž     */
    '\u035f',
    /*     ÍŸ     */ '\u0360',
    /*     Í      */ '\u0362',
    /*     Í¢     */ '\u0338',
    /*     Ì¸     */
    '\u0337',
    /*     Ì·     */ '\u0361',
    /*     Í¡     */ '\u0489' /*     Ò‰_     */
  ];

  //rand function
  int rand(int max) => Random().nextInt(max);

  //get random char from zalgo char table
  String randZalgo(List zalgoList) {
    try {} catch (e) {}

    final index = Random().nextInt(zalgoList.length);
    return zalgoList[index];
  }

  bool isZalgoChar(String c) {
    for (var i = 0; i < zalgo_up.length; i++) {
      if (c == zalgo_up[i]) {
        return true;
      }
    }
    for (var i = 0; i < zalgo_down.length; i++) {
      if (c == zalgo_down[i]) {
        return true;
      }
    }
    for (var i = 0; i < zalgo_mid.length; i++) {
      if (c == zalgo_mid[i]) {
        return true;
      }
    }
    return false;
  }

  var zalgoText = '';

  for (var i = 0; i < removedEmojie.length; i++) {
    if (isZalgoChar(removedEmojie[i])) {
      continue;
    }

    int numUp;
    int numMid;
    int numDown;

    zalgoText += removedEmojie[i];

    if (zalgoOptMini) {
      numUp = rand(8);
      numMid = rand(2);
      numDown = rand(8);
    } else if (zalgoOptNormal) {
      numUp = rand(16) ~/ 2 + 1;
      numMid = rand(6) ~/ 2;
      numDown = rand(16) ~/ 2 + 1;
    } else if (zalgoOptMaxi) {
      numUp = rand(64) ~/ 4 + 3;
      numMid = rand(16) ~/ 4 + 1;
      numDown = rand(64) ~/ 4 + 3;
    } else {
      numUp = 0;
      numMid = 0;
      numDown = 0;
    }

    if (up) {
      for (var j = 0; j < numUp; j++) {
        zalgoText += randZalgo(zalgo_up);
      }
    }
    if (mid) {
      for (var j = 0; j < numMid; j++) {
        zalgoText += randZalgo(zalgo_mid);
      }
    }
    if (down) {
      for (var j = 0; j < numDown; j++) {
        zalgoText += randZalgo(zalgo_down);
      }
    }
  }
  return zalgoText;
}

//-------------------------------<< HASH FUNCTIONS >>-------------------------------

String getSha1Hash(String input) => sha1.convert(utf8.encode(input)).toString();

String getSha224Hash(String input) =>
    sha224.convert(utf8.encode(input)).toString();
String getSha256Hash(String input) =>
    sha256.convert(utf8.encode(input)).toString();
String getSha384Hash(String input) =>
    sha384.convert(utf8.encode(input)).toString();
String getSha512Hash(String input) =>
    sha512.convert(utf8.encode(input)).toString();
String getMd5Hash(String input) => md5.convert(utf8.encode(input)).toString();
