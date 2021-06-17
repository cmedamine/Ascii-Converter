part of 'dcode_bloc.dart';

abstract class DcodeState extends Equatable {
  const DcodeState();

  @override
  List<Object> get props => [];
}

class DcodeInitial extends DcodeState {}

class Encoded extends DcodeState {
  final String encoded;

  Encoded({@required this.encoded});
  @override
  List<Object> get props => [encoded];
}

class Decoded extends DcodeState {
  final String decoded;

  Decoded({@required this.decoded});
  @override
  List<Object> get props => [decoded];
}
