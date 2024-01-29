import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../global_auth_observable/global_auth_state.dart';

class AuthNotifier extends ChangeNotifier {
  GlobalAuthViewState get authState => _observable.state;
  User? get signedUser => _observable.state.whenOrNull(connected: (user) => user);

  late GlobalAuthStateObservable _observable;
  late ReactionDisposer _reactionDisposer;

  AuthNotifier() {
    _observable = GlobalAuthStateObservable();
    _reactionDisposer = reaction((_) => _observable.state, _updateUser);
    FirebaseAuth.instance.authStateChanges().listen(_onUserReceived);
  }

  void _onUserReceived(User? user) => _observable.onUserReceived(user);

  void _updateUser(GlobalAuthViewState state) => notifyListeners();

  @override
  void dispose() {
    _reactionDisposer();
    super.dispose();
  }
}
