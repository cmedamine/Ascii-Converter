part of 'dcode_bloc.dart';

abstract class DcodeEvent extends Equatable {
  const DcodeEvent();

  @override
  List<Object> get props => [];
}


class ClearEncoded extends DcodeEvent{}
class ClearDecoded extends DcodeEvent{} 

class GetBinaryFromString extends DcodeEvent {
  final String textString;

  GetBinaryFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromBinary extends DcodeEvent {
  final String textString;

  GetStringFromBinary(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetAsciiFromString extends DcodeEvent {
  final String textString;

  GetAsciiFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromAscii extends DcodeEvent {
  final String textString;

  GetStringFromAscii(this.textString);
  @override
  List<Object> get props => [textString];
}

class GetHexFromString extends DcodeEvent {
  final String textString;

  GetHexFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromHex extends DcodeEvent {
  final String textString;

  GetStringFromHex(this.textString);
  @override
  List<Object> get props => [textString];
}

class GetOctalFromString extends DcodeEvent {
  final String textString;

  GetOctalFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromOctal extends DcodeEvent {
  final String textString;

  GetStringFromOctal(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetReversedLettersFromString extends DcodeEvent {
  final String textString;

  GetReversedLettersFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromReversedLetters extends DcodeEvent {
  final String textString;

  GetStringFromReversedLetters(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetReversedWordsFromString extends DcodeEvent {
  final String textString;

  GetReversedWordsFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromReversedWords extends DcodeEvent {
  final String textString;

  GetStringFromReversedWords(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetCapitalizedSentenseFromString extends DcodeEvent {
  final String textString;

  GetCapitalizedSentenseFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromCapitalizedSentense extends DcodeEvent {
  final String textString;

  GetStringFromCapitalizedSentense(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetCapitalizedWordsFromString extends DcodeEvent {
  final String textString;

  GetCapitalizedWordsFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromCapitalizedWords extends DcodeEvent {
  final String textString;

  GetStringFromCapitalizedWords(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetUpperCasedFromString extends DcodeEvent {
  final String textString;

  GetUpperCasedFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromUpperCased extends DcodeEvent {
  final String textString;

  GetStringFromUpperCased(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetLowerCasedFromString extends DcodeEvent {
  final String textString;

  GetLowerCasedFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromLowerCased extends DcodeEvent {
  final String textString;

  GetStringFromLowerCased(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetUpsideDown extends DcodeEvent {
  final String textString;

  GetUpsideDown(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetUpsideDownNormal extends DcodeEvent {
  final String textString;

  GetUpsideDownNormal(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetMorseFromString extends DcodeEvent {
  final String textString;

  GetMorseFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromMorse extends DcodeEvent {
  final String textString;

  GetStringFromMorse(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetRandomCaseFromString extends DcodeEvent {
  final String textString;

  GetRandomCaseFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromRandomCase extends DcodeEvent {
  final String textString;

  GetStringFromRandomCase(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetBase64EncodeString extends DcodeEvent {
  final String textString;

  GetBase64EncodeString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetBase64DecodeString extends DcodeEvent {
  final String textString;

  GetBase64DecodeString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetNatoFromString extends DcodeEvent {
  final String textString;

  GetNatoFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromNato extends DcodeEvent {
  final String textString;

  GetStringFromNato(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetZalgoMiniFromString extends DcodeEvent {
  final String textString;

  GetZalgoMiniFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromZalgoMini extends DcodeEvent {
  final String textString;

  GetStringFromZalgoMini(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetZalgoNormalFromString extends DcodeEvent {
  final String textString;

  GetZalgoNormalFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromZalgoNormal extends DcodeEvent {
  final String textString;

  GetStringFromZalgoNormal(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetZalgoMaxiFromString extends DcodeEvent {
  final String textString;

  GetZalgoMaxiFromString(this.textString);

  @override
  List<Object> get props => [textString];
}

class GetStringFromZalgoMaxi extends DcodeEvent {
  final String textString;

  GetStringFromZalgoMaxi(this.textString);

  @override
  List<Object> get props => [textString];
}

//-------------------------------<< HASH EVENTS >>-------------------------------


// SHA-1
// SHA-224
// SHA-256
// SHA-384
// SHA-512
// SHA-512/224
// SHA-512/256
// MD5

class GetSha1FromString extends DcodeEvent {
  final String textString;

  GetSha1FromString(this.textString);

  @override
  List<Object> get props => [textString];
}


class GetSha224FromString extends DcodeEvent {
  final String textString;

  GetSha224FromString(this.textString);

  @override
  List<Object> get props => [textString];
}


class GetSha256FromString extends DcodeEvent {
  final String textString;

  GetSha256FromString(this.textString);

  @override
  List<Object> get props => [textString];
}


class GetSha384FromString extends DcodeEvent {
  final String textString;

  GetSha384FromString(this.textString);

  @override
  List<Object> get props => [textString];
}


class GetSha512FromString extends DcodeEvent {
  final String textString;

  GetSha512FromString(this.textString);

  @override
  List<Object> get props => [textString];
}


class GetMd5FromString extends DcodeEvent {
  final String textString;

  GetMd5FromString(this.textString);

  @override
  List<Object> get props => [textString];
}


