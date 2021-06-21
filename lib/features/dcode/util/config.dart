import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../bloc/dcode_bloc.dart';

enum TextConvertionMenuItems {
  Binary,
  Ascii,
  Hex,
  Octal,
  ReversedLetters,
  ReversedWords,
  CapitalizeSentense,
  CapitalizeWords,
  UpperCase,
  LowerCase,
  UpsideDown,
  Morse,
  ZalgoMini,
  ZalgoNormal,
  ZalgoBig,
  Base64,
  RandomCase,
  Nato,
}

// SHA-1
// SHA-224
// SHA-256
// SHA-384
// SHA-512
// SHA-512/224
// SHA-512/256
// MD5

enum TextHashMenuItems {
  SHA1,
  SHA224,
  SHA256,
  SHA384,
  SHA512,
  MD5,
  //TODO add new hash method,
}

const Map<String, String> binInfo = {
  'About Convert text to binary tool':
      '''Convert text into binary. Computers store all characters as numbers stored as binary data. Binary code uses the digits of 0 and 1 (binary numbers) to represent computer instructions or text. Each instruction or symbol gets a bit string assignment. The strings can correspond to instructions, letters, or symbols.  In computing, these codes are used for encoding data.

This base-2 or binary numeral system is used in mathematics and computer science. The system represents values using just the two symbols. The values in the binary systems are typically called binary numbers.

In digital electronics and more specifically in digital electronic circuits that use logic gates (with values of 0 and 1), computers use the binary system internally. Computer based devices use the binary system as well with this including mobile phones.

You can convert to and from binary and the base-10 system typically used by humans. You can also convert to and from binary and hexadecimal where you need four digits of binary to represent one digit of hex. Converting to and from binary and octal is another possibility. It takes three binary digits to represent an octal digit. Binary 000 is octal digit 0.
With binary code you use the binary numbering sytem to represent text or instructions.''',
};

const Map<String, String> asciiInfo = {
  'About ASCII to text converter tool':
      '''Convert text into ASCII number format. For example A is 065. Text in a computer is stored as numbers called ASCII numbers with each letter having its own number. Input text to convert to these ASCII numbers. ASCII is short for American Standard Code for Information Interchange. With applications in computers and other devices that use text, ASCII codes represent text. Based on the English alphabet, ASCII is a character-encoding scheme. ASCII was originally developed from telegraphic codes.

Computers can only understand numbers, and ASCII codes are numerical representations of characters that a computer can understand. Examples of characters are a, 1, or >. For example, 097 is the ASCII numerical representation of the character a. ASCII covers over 100 characters with some of these characters being control characters that control how text appears.

Work on ASCII began in the 1960’s through a committee of the American Standards Association. Many of today’s character-encoding schemes are based on ASCII, plus they include additional characters. At one time ASCII was used on the World Wide Web as the most commonly used character encoding.

If you prepare a text in ASCII format, you will get plain text with no format such as bold, and any computer can understand the format. Other schemes such as HTML cover formatting.''',
};




const Map<String, String> hexInfo = {
  'About Convert hexadecimal to text tool': '''Convert text into hexadecimal format. Computers store text as numbers, and with hex you display the numbers not as a decimal number, but in base 16. Hex or base 16 or hexadecimal is a numeral system that uses 16 symbols. The symbols include 0-9 and a-f (sometimes A-F).  An example of a hexadecimal number is 3BF2. Computer science applications can use hexadecimal for binary coding in computing and digital electronics.  The primary use of hex is a more people friendly way to represent the value.

While computers work with binary data, it can be difficult for humans to work with a large number of digits. Humans typically use a base 10 system, while for computer applications it is easier to work with hexadecimal than decimal.

As hex saves space (either paper space or screen space), you can more efficiently use hex instead of a large number of ones and zeros. You can also go from hex back to binary bits if needed. For example A is 1010.

Hex numbers represent large numbers compactly and are used in programming as computers use bytes as a unit of information. In hex you need two digits where you need 8 binary digits to represent a byte.

Hexadecimal is also used in the Red-Green-Blue color system in computers. Red, green, and blue are each represented by a byte that is two hex digits. An RGB color uses six hex digits. Hexadecimal is also commonly used to represent computer memory addresses.''',
};

const Map<String, String> octalInfo = {
  'About Convert octal to text tool':'''Convert text to octal. Each character is represented by three numbers. Octo or octal refers to a base 8 numeral system.  Digits 0 to 7 are used. Binary numbers can make up octal number. For an octal system each decimal place is a power of eight, in contrast to a decimal system where each place is a power of ten.

Oct for short, the octal numeral system or base 8 system provides an easy conversion from binary. Three binary digits represent one octal digit. Octal 0 is binary 000. You make octal numbers from binary numbers by grouping binary digits into groups of three.

In computer applications octal started to be used when systems used 12, 24, or 36 bit words, and octal became a handy short form for binary. You can divide word size by 3, and an octal digit represents three binary digits. So you can use 4, 8, or 12 digits to display a machine word. You can also use octal for displays in application for a calculator where binary is too complicated.

In today’s programming languages, hexadecimal is common. Two hexadecimal digital correspond to one byte. However, in some applications, it is easier to use octal with some instructions. Octal has the advantage over hex in that it uses only digits as opposed to hex that uses 16 characters that include digits and letters.''',
};

const Map<String, String> reverseLettersInfo = {
  'About Reverse letters tool':'''Reverse letters is one strategy of transformation of text that involves transformation for uses such as HTML and plain text that do not support such a transformation.  Applications that include Microsoft Excel, Word, and Publisher can perform a reverse text. 

HTML does not allow for such transformation so this utility can provide for a reverse text transformation. The reverse text that appears in the Output area provides a straight forward transformation.

Possible use could be encoding or for uses with Arabic languages that are left to right. Another possible use is storing passwords in a database in a way that would make the passwords unreadable.

Other utilities provide for more variations in transformation such as flipping horizontally, inverting characters, turning characters, rotating characters, mirror writing, mirror images, applications for Cyrillic characters, and special typefaces.

The term “text transformations” includes tools that change the features of text. Some of the examples of this category include spell check, word prediction software, speech recognition software, and other software programs.''',
};
const Map<String, String> reverseWordsInfo = {
  'About Reverse words tool':'''Place words in a sentence in reverse order. Here is an example. See me sing. sing me See.

This is one strategy of transformation of text that involves transformation for uses such as HTML and plain text that do not support such a transformation.  HTML does not allow for such transformation so this utility can provide for a reverse text transformation. The reverse text that appears in the Output area provides a straight forward transformation.

Possible use could be encoding or for uses with Arabic languages that are left to right. Another possible use is storing passwords in a database in a way that would make the passwords unreadable.

Other utilities provide for more variations in transformation such as flipping horizontally, inverting characters, turning characters, rotating characters, mirror writing, mirror images, applications for Cyrillic characters, and special typefaces.

The term “text transformations” includes tools that change the features of text. Some of the examples of this category include spell check, word prediction software, speech recognition software, and other software programs.''',
};

const Map<String, String> capitalizeSentenceInfo = {
  'About Capitalize sentence tool':'''Capitalize the first letter of the first word in a sentence. Instead of “see me run” you get “See me run” as the output. With some languages such as English the rules of standard grammar state that a complete sentence begins with a capital letter. A sentence can be a statement, request, or suggestion. It can also be a question or exclamation. A sentence normally includes a noun that acts as subject and a verb. Some languages allow subjects to be omitted.

Sentences can be simple, compound, of complex. A simple sentence includes a single clause. A compound sentence includes more than one clause and a conjunction. A complex sentence includes an independent and dependent clause.

A declarative sentence is the most common type of sentence. A question can request information or be rhetorical. An exclamation can also be a sentence. An imperative sentence is a command.

Use a complete sentence.

That is an example of an imperative sentence. Sentence length can determine the complexity of the sentence. In general, the more the number of words in a sentence, the more difficult it is to understand the sentence. The Gunning fog index is one measure of readability of writing in English. The index relates readability to the years of formal schooling needed to understand the sentence.''',
};

const Map<String, String> capitalizeWordsInfo = {
  'About Capitalize words tool':'''Convert text to make each word start with an initial uppercase or capital letter. For example “See me run” becomes “See Me Run” instead. One rule of standard English is to capitalize a proper noun that is a specific person (such as John Smith), place (such as Paris), or thing (such as the Eiffel Tower).

Another rule is to capitalize the first word of a sentence or quote such as he said, “Yes, I will.”  The names of days and months such as Tuesday and January are also capitalized as are holidays such as Halloween and Memorial Day. Capitalize a person’s title when used with their name such as President Smith will speak, and when a president speaks we always attend.

Capitalize a direction when it refers to an area such as when you come from the West, but do not capitalize if you refer to a direction such as I go north on Main Street every day.  Capitalize words such as Main Street when they refer to a specific location not just a street in the city.  Concerning capital letters in other languages, these vary greatly from language to language with German a particular example of rules that depart from English standard usage.

Some writing systems make no distinction between uppercase and lowercase.''',
};
const Map<String, String> upperCaseInfo = {
  'About Convert text to uppercase tool':'''Convert text to all uppercase letters. Here is an example. The word hello becomes HELLO.

Also called capital letters, caps, and upper-case, uppercase refers to letters in certain languages. In Latin script, the first three letters of the alphabet appear in uppercase letters are A, B, C, while in lowercase they appear as a, b, c. Another Western language that uses uppercase is Cyrillic. Some languages have no uppercase. Normally, if a letter has an uppercase, the letter has a corresponding lowercase. Grammar rules and conventions normally determine when to use uppercase though stylistic elements such a title can also determine when to use upper case. Proper nouns often appear with an initial cap or in upper case.

Acronyms such as ASCII or HTML often appear with uppercase for all the letters. An initial upper case letter appears in standard English conventions such as capitalizing a proper noun, first word of a sentence, name of days and months such as Monday and January, and names of religious and non-religious holidays such as Christmas and Memorial Day. Instead of HTML, you can sometimes see html, but this is not normally considered standard style and should be converted to upper case. Examples of other uses of upper case are explained in references such as the Chicago Manual of Style.''',
};


const Map<String, String> lowerCaseInfo = {
  'About Convert text to lowercase tool':'''Convert text to all lowercase letters. Here is an example. The word HELLO becomes hello.

In contrast to uppercase or capital letters, lowercase letters appear in certain language such as those that use the Latin or Cyrillic alphabets. As an example the letters a, b, and c are in lower case while the letters A, B, and C are in upper case. Some writing systems make no distinction between uppercase and lowercase letters and are called unicase. With an uppercase and lowercase letter normally the sound the letter represents is the same. Another alphabet that uses upper and lower case is Cyrillic.

Some languages have only lower case letters, but normally if a letter has an uppercase, the letter has a corresponding lowercase. Grammar rules and conventions normally determine when to use uppercase and lowercase. For some acronyms such as HTML, you sometimes see html, but this is not normally considered standard usage and should appear in upper case. Explanations of use of upper case and lower case appear in grammar books and style guides such as with AP style or a reference such as the Chicago Manual of Style. Lowercase is also not used for the first letter in a proper noun.''',
};

const Map<String, String> randomCaseInfo = {
  'About Randomcase tool':'''Convert text to random case letters. For example “HELLO” can become “h-e-L-L-O” with no pattern. With random case the rules of grammar that determine upper and lower case do not apply. Upper case or capital letters appear in a random sequence. Lower case letters also appear in a random sequence. Random refers to a pattern or series that has no pattern. This can be helpful for creating security codes. The random qualities can be unique. Randomness traditionally was generated through devices such as dice but computed randomness today can easily create randomness for statistical sampling, simulations, and cryptography.

The generation of randomness can be a typical task in computer programming. In statistically theory, randomization can be an important task with an application such as survey sampling. With letters in this random case application, the qualities of random generation apply and standard rules of the use of uppercase and lowercase do not apply. Some writing systems make no distinction between uppercase and lowercase letters but the random case utility could be effective here also for certain applications. For security reasons, random case could be useful. One use of randomness concerns search algorithms. In statistical theory, randomization is an important principle with survey sampling as an example.''',
};

const Map<String, String> morseInfo = {
  'About Convert text to morse code tool':'''Convert text to Morse Code that normally uses on and off clicks, tones, or lights. Morse code transmits text information.  The recipient can understand the message without additional decoding equipment.  Morse code covers Latin letters with some extensions for non-Latin letters, Arabic numbers, and punctuation.  Dits refer to dots.  Dahs defer to dashes. These dits/dots and dahs/dashes provide the code.  Some applications include amateur radio and aeronautical aids such as VORs. SOS is a common distress signal using three dashes and three dots and uses Morse code.

An observer can understand Morse code without special equipment which can be an advantage in, for example, an emergency situation.  This code can also be useful when poor signal conditions exist, and the human voice is difficult to decode. 

While this code covers the basic Latin alphabet and Arabic numerals, extensions to the code cover languages that use more than the Latin alphabet letters.

Samuel Morse developed the foundation for Morse code in the 1800s when he worked with an electrical telegraph system sending pulses of electric current and an electromagnet. His code used the pulse and breaks between them to transmit information.  Popular with amateur radio operators, this code is no longer required if you want to get a U.S. pilots or air traffic controller license, though these individuals often have a basic understanding of the code. ''',
};


const Map<String, String> natoInfo = {
  'About Convert text to nato phonetic alphabet tool':'''Imagine that you are a radiotelegraph operator during the war trying to warn soldiers on the front lines of an incoming mustard gas attack. Messages can be distorted due to the noise of battle, poor broadcast signal, or even language barriers. However, if the transmission uses a radiotelephonic spelling alphabet – substituting a code word for each letter of the alphabet – then critical messages are more likely to be understood correctly.
  
  The NATO phonetic alphabet became effective in 1956 and just a few years later became the established universal phonetic alphabet. However, it took several adaptations before the version used today came into effect.

In the 1920s, the International Telecommunication Union (ITU) produced the first phonetic alphabet to be recognized internationally. It featured names of cities across the globe.

Amsterdam, Baltimore, Casablanca, Denmark, Edison, Florida, Gallipoli, Havana, Italia, Jerusalem, Kilogramme, Liverpool, Madagascar, New York, Oslo, Paris, Quebec, Roma, Santiago, Tripoli, Uppsala, Valencia, Washington, Xanthippe, Yokohama, Zurich.

On the military side, the United States adopted a Joint Army/Navy Phonetic Alphabet, called the Able Baker alphabet after the first two code words, across all of its military branches in 1941. Two years later, the British Royal Air Force decided to use the Able Baker alphabet as well.

Able, Baker, Charlie, Dog, Easy, Fox, George, How, Item, Jig, King, Love, Mike, Nan, Oboe, Peter, Queen, Roger, Sugar, Tare, Uncle, Victor, William, X-ray, Yoke, Zebra

A common criticism of these alphabets was that they were rather English in composition. A new version incorporating sounds common to English, French, and Spanish was proposed by the International Air Transport Association (IATA) and came into effect on 1 November 1951 for civil aviation only. It is similar to the one used today.

Alfa, Bravo, Coca, Delta, Echo, Foxtrot, Gold, Hotel, India, Juliett, Kilo, Lima, Metro, Nectar, Oscar, Papa, Quebec, Romeo, Sierra, Tango, Union, Victor, Whiskey, eXtra, Yankee, Zulu

As militaries and NATO continued to follow the Able Baker phonetic alphabet, it was clear the need for a universal phonetic alphabet still remained. A review of the Able Baker alphabet, spearheaded by NATO Allies US and UK, was conducted.
  ''',
};

const Map<String, String> upsideDownInfo = {
  'About Convert text to upside down text tool':'''The upside down generator flips the input text horizontally and reverses it. This is done by analyzing each input character and replacing it by another Unicode character which resembles the flipped version of it.
  
The text generated can be used either for fun on various online web-sites and chat systems, or to create a strong password: mypassword will become pɹoʍssɐdʎɯ which is easy enough to remember and re-generate using this tool.''',
}; 

const Map<String, String> zalgoInfo = {
  'About Convert text to zalgo text tool':'''Zalgo text was pioneered in 2004 by a Something Awful forum member who created image macros of cartoon characters with a glitched or distorted appearance exclaiming "Zalgo!" The text in the images was often distorted, and the style of the distortion became popularised as "Zalgo text". The characters were often depicted bleeding from their eyes, and forum members interpreted Zalgo as an unimaginable, eldritch apocalyptic figure.
  
  Zalgo text is made taking a string of text and excessively adding Unicode diacritic marks on top of one another. Historically, it has primarily been used in horror or copypasta memes. Its improperly rendered or glitched-out symbols make it prevalent amongst memes intended to make the reader's computer seem like it is malfunctioning. Zalgo text has become popular in the world of "surreal memes", which are intended to come across as bizarre or absurd. A common signifier of surreal memes, Zalgo text ties in with an overall aesthetic sensibility of the strange and impossible that includes elements such as clip art and strange-looking recurring characters but refuses to represent real-world elements such as real people or brands.
  
  Zalgo text has also been used or alluded to outside of Internet memes. A fan-made campaign logo for the Michael Bloomberg 2020 presidential campaign was described as closely resembling Zalgo text. In 2020, a teenager and TikTok creator used the word "hamburger" in Zalgo text for his school yearbook caption; when the yearbook was printed, the text overlapped his photograph and that of the student below him.
  
  In addition to legitimate uses, Zalgo text has been used maliciously to crash or overwhelm messaging apps. The Apple iMessage app is unable to properly handle Zalgo text and will crash if it tries to render a message that contains Zalgo text. This behavior has been used to perform denial-of-service attacks against iOS users. Similarly, Zalgo messages sent over Gmail have caused crashes.''',
};

const Map<String, String> base64Info = {
  'About Base64 tool':'''Place an entry in the Input window and crypt or decrypt via Base64.

Base64 is a group of schemes that encode binary to text. This represents binary data in an ASCII strong format. Translation is done via radix 64. The term comes from a MIME encoding. These schemes are typically used when you need to encode binary data stored over media that deals with textual data. Data remains intact with no modification during transport. Email via MIME is one application. Storing data in XML is another application. Encoding that is now called MIME Base64 was first used in a standardized way was through privacy-enhanced mail using the PEM protocol in the mid 1980’s. PEM uses a Base64 scheme that transforms octets to a format of 60bit characters that can use SMTP.

Here is an example using Crypt.

Input data
This is some text to convert via Crypt.
Output:
VGhpcyBpcyBzb21lIHRleHQgdG8gY29udmVydCB2aWEgQ3J5cHQu''',
};

Map<String, String> sheetInfoText = binInfo;


extension SelectedTextConvertionConfigExtension on TextConvertionMenuItems {
  String get name => describeEnum(this);
  String get displayConfig {
    switch (this) {
      case TextConvertionMenuItems.Binary:
        return 'Binary';
      case TextConvertionMenuItems.Ascii:
      
        return 'Ascii';
      case TextConvertionMenuItems.Hex:
        return 'Hex';
      case TextConvertionMenuItems.Octal:
        return 'Octal';
      case TextConvertionMenuItems.ReversedLetters:
        return 'Reversed letters';
      case TextConvertionMenuItems.ReversedWords:
        return 'Reversed words';
      case TextConvertionMenuItems.CapitalizeSentense:
        return 'Capitalize sentense';
      case TextConvertionMenuItems.CapitalizeWords:
        return 'Capitalize words';
      case TextConvertionMenuItems.UpperCase:
        return 'Upper case';
      case TextConvertionMenuItems.LowerCase:
        return 'Lower case';
      case TextConvertionMenuItems.UpsideDown:
        return 'Upside down';
      case TextConvertionMenuItems.Morse:
        return 'International morse code';
      case TextConvertionMenuItems.ZalgoMini:
        return 'Zalgo mini';
      case TextConvertionMenuItems.ZalgoNormal:
        return 'Zalgo normal';
      case TextConvertionMenuItems.ZalgoBig:
        return 'Zalgo big';
      case TextConvertionMenuItems.Base64:
        return 'Base 64';
      case TextConvertionMenuItems.RandomCase:
        return 'Random case';
      case TextConvertionMenuItems.Nato:
        return 'Nato';
      default:
        return 'null';
    }
  }
}

extension SelectTextHashConfigExtension on TextHashMenuItems {
  String get name => describeEnum(this);
  String get displayConfig {
    switch (this) {
      case TextHashMenuItems.SHA1:
        return 'SHA-1';
      case TextHashMenuItems.SHA224:
        return 'SHA-224';
      case TextHashMenuItems.SHA256:
        return 'SHA-256';
      case TextHashMenuItems.SHA384:
        return 'SHA-384';
      case TextHashMenuItems.SHA512:
        return 'SHA-512';
      case TextHashMenuItems.MD5:
        return 'MD5';
      default:
        return 'null';
    }
  }
}

DcodeEvent encode;
DcodeEvent decode;

TextConvertionMenuItems textConvertionMenuItem = TextConvertionMenuItems.Binary;
TextHashMenuItems textHashMenuItem = TextHashMenuItems.SHA1;

void setTextConversionConfig({
  TextConvertionMenuItems textConvertionMenuItem,
  String decodeText,
  String encodeText,
}) {
  switch (textConvertionMenuItem) {
    case TextConvertionMenuItems.Binary:
      encode = GetBinaryFromString(decodeText);
      decode = GetStringFromBinary(encodeText);
      break;
    case TextConvertionMenuItems.Ascii:
      encode = GetAsciiFromString(decodeText);
      decode = GetStringFromAscii(encodeText);
      break;

    case TextConvertionMenuItems.Hex:
      encode = GetHexFromString(decodeText);
      decode = GetStringFromHex(encodeText);
      break;
    case TextConvertionMenuItems.Octal:
      encode = GetOctalFromString(decodeText);
      decode = GetStringFromOctal(encodeText);
      break;
    case TextConvertionMenuItems.ReversedLetters:
      encode = GetReversedLettersFromString(decodeText);
      decode = GetStringFromReversedLetters(encodeText);
      break;

    case TextConvertionMenuItems.ReversedWords:
      encode = GetReversedWordsFromString(decodeText);
      decode = GetStringFromReversedWords(encodeText);
      break;

    case TextConvertionMenuItems.CapitalizeSentense:
      encode = GetCapitalizedSentenseFromString(decodeText);
      decode = GetStringFromCapitalizedSentense(encodeText);
      break;

    case TextConvertionMenuItems.CapitalizeWords:
      encode = GetCapitalizedWordsFromString(decodeText);
      decode = GetStringFromCapitalizedWords(encodeText);
      break;

    case TextConvertionMenuItems.UpperCase:
      encode = GetUpperCasedFromString(decodeText);
      decode = GetStringFromUpperCased(encodeText);
      break;

    case TextConvertionMenuItems.LowerCase:
      encode = GetLowerCasedFromString(decodeText);
      decode = GetStringFromLowerCased(encodeText);
      break;

    case TextConvertionMenuItems.UpsideDown:
      encode = GetUpsideDown(decodeText);
      decode = GetUpsideDownNormal(encodeText);
      break;

    case TextConvertionMenuItems.Morse:
      encode = GetMorseFromString(decodeText);
      decode = GetStringFromMorse(encodeText);

      break;

    case TextConvertionMenuItems.Base64:
      encode = GetBase64EncodeString(decodeText);
      decode = GetBase64DecodeString(encodeText);

      break;

    case TextConvertionMenuItems.RandomCase:
      encode = GetRandomCaseFromString(decodeText);
      decode = GetStringFromRandomCase(encodeText);
      break;
    case TextConvertionMenuItems.Nato:
      encode = GetNatoFromString(decodeText);
      decode = GetStringFromNato(encodeText);
      break;
    case TextConvertionMenuItems.ZalgoMini:
      encode = GetZalgoMiniFromString(decodeText);
      decode = GetStringFromZalgoMini(encodeText);
      break;

    case TextConvertionMenuItems.ZalgoNormal:
      encode = GetZalgoNormalFromString(decodeText);
      decode = GetStringFromZalgoNormal(encodeText);
      break;

    case TextConvertionMenuItems.ZalgoBig:
      encode = GetZalgoMaxiFromString(decodeText);
      decode = GetStringFromZalgoMaxi(encodeText);
  }

  // SHA-1
  // SHA-224
  // SHA-256
  // SHA-384
  // SHA-512
  // SHA-512/224
  // SHA-512/256
  // MD5
}

void setTextHashConfig({
  TextHashMenuItems textHashMenuItem,
  String decodeText,
}) {
  switch (textHashMenuItem) {
    case TextHashMenuItems.SHA1:
      encode = GetSha1FromString(decodeText);
      break;
    case TextHashMenuItems.SHA224:
      encode = GetSha224FromString(decodeText);
      break;
    case TextHashMenuItems.SHA256:
      encode = GetSha256FromString(decodeText);
      break;
    case TextHashMenuItems.SHA384:
      encode = GetSha384FromString(decodeText);
      break;
    case TextHashMenuItems.SHA512:
      encode = GetSha512FromString(decodeText);
      break;
    case TextHashMenuItems.MD5:
      encode = GetMd5FromString(decodeText);
      break;
    default:
  }
}



Map<String, String> sheetInfoHash = {
  'About SHA create hash tool': '''Complete a SHA output on the data in the Input window choosing from Sha-1, Sha-224, Sha-256, Sha-384, or Sha-512. This set of cryptographic hash functions was designed by the US National Security Agency (NSA) and published in the early 2000’s.

Short for Secure Has Algorithm, the Sha function is an algorithm that hashes data such as a text file into a fixed length variable know as a has. This computed hash value is then used to verify copies of the original data. You cannot recreate the original from the hash value. The SHA functions include digests for 224, 256, 384, or 512 bits.

Security provided by a hash algorithm depends on it being able to produce a unique value. A collision occurs when you get the same hash value for different data. A strong hash value is resistant to computational attacks. With a weak hash it could be possible to produce a collision. A broken hash is where collisions occurred.

Security flaws have been detected in SHA-1, but the other SHA algorithms do not have these flaws.

Hash keying is also known as convergent encryption. This keying and encryption is a cryptosystem that produces ciphertext from plain text.''',
};
