import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobx/mobx.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthViewState with _$AuthViewState {
  const AuthViewState._();

  const factory AuthViewState.idle() = _Idle;
  const factory AuthViewState.loading() = _Loading;
  const factory AuthViewState.error(String? message) = _Error;
  const factory AuthViewState.success(UserCredential user) = _Success;
}

class AuthStateObservable = AuthStateObservableBase with _$AuthStateObservable;

abstract class AuthStateObservableBase with Store {
  @observable
  AuthViewState viewState = const AuthViewState.idle();

  @action
  void onSuccess(UserCredential userCredential) {
    viewState = AuthViewState.success(userCredential);
  }

  @action
  void onError(String? message) {
    viewState = AuthViewState.error(message);
  }

  @action
  void onLoading() {
    viewState = const AuthViewState.loading();
  }
}
