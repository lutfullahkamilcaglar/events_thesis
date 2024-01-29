import 'package:equatable/equatable.dart';

abstract class CompletionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Idle extends CompletionState {}

class Success extends CompletionState {}

class Fail extends CompletionState {
  final String? message;

  Fail({this.message});

  @override
  List<Object?> get props => [message];
}
