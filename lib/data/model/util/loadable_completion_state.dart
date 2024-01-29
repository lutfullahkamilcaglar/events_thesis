import 'package:equatable/equatable.dart';

abstract class LoadableCompletionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Idle extends LoadableCompletionState {}

class Success extends LoadableCompletionState {}

class Loading extends LoadableCompletionState {}

class Fail extends LoadableCompletionState {
  final String? message;

  Fail({this.message});

  @override
  List<Object?> get props => [message];
}
