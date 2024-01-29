import 'package:equatable/equatable.dart';

abstract class EffectState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Idle extends EffectState {}

class Effect extends EffectState {
  final String message;

  Effect(this.message);

  @override
  List<Object?> get props => [message];
}
