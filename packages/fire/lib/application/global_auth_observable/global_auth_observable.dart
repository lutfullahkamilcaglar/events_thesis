import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobx/mobx.dart';

import 'global_auth_state.dart';

class GlobalAuthObservable extends Cubit<GlobalAuthViewState> {
  late GlobalAuthStateObservable observable;
  late ReactionDisposer _reactionDisposer;
  // TODO

  GlobalAuthObservable() : super(const GlobalAuthViewState.loading()) {
    observable = GlobalAuthStateObservable();
    _reactionDisposer = reaction((_) => observable.state, (state) => emit(state));
    FirebaseAuth.instance.authStateChanges().listen(_listenUserChanges);
  }

  void _listenUserChanges(User? user) => observable.onUserReceived(user);

  @override
  Future<void> close() async {
    _reactionDisposer();
    super.close();
  }
}
