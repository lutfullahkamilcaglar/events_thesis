import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobx/mobx.dart';

part 'global_auth_state.freezed.dart';
part 'global_auth_state.g.dart';

@freezed
class GlobalAuthViewState with _$GlobalAuthViewState {
  const GlobalAuthViewState._();

  const factory GlobalAuthViewState.loading() = _Loading;
  const factory GlobalAuthViewState.disconnected() = _Disconnected;
  const factory GlobalAuthViewState.connected({required User user}) = _Connected;
}

class GlobalAuthStateObservable = GlobalAuthStateObservableBase with _$GlobalAuthStateObservable;

abstract class GlobalAuthStateObservableBase with Store {
  @observable
  GlobalAuthViewState state = const GlobalAuthViewState.loading();

  @action
  void onUserReceived(User? user) {
    state = user != null
        ? GlobalAuthViewState.connected(user: user)
        : const GlobalAuthViewState.disconnected();
  }
}
