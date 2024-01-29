import 'package:d_events/domain/model/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthorizationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingState extends AuthorizationState {}

class NotActiveState extends AuthorizationState {}

class ActiveState extends AuthorizationState {
  final User user;

  ActiveState(this.user);

  @override
  List<Object> get props => [user];
}

class ErrorViewState extends AuthorizationState {}