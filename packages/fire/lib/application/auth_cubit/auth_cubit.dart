import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobx/mobx.dart';
import '../../domain/auth/auth_repository.dart';
import '../../domain/model/result.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthViewState> {
  late AuthStateObservable observable;
  late ReactionDisposer _reactionDisposer;

  final AuthRepository _repository;

  AuthCubit(this._repository) : super(const AuthViewState.idle()) {
    observable = AuthStateObservable();
    _reactionDisposer = reaction(
      (_) => observable.viewState,
      (state) => emit(state),
    );
  }

  void signIn(String email, String password) async {
    observable.onLoading();
    final Result<UserCredential> res = await _repository.signIn(email, password);
    res.map(
      success: (success) => observable.onSuccess(success.data),
      error: (error) => observable.onError(error.message),
    );
  }

  void signUp(String email, String password) async {
    observable.onLoading();
    final Result<UserCredential> res = await _repository.signUp(email, password);
    res.map(
      success: (success) => observable.onSuccess(success.data),
      error: (error) => observable.onError(error.message),
    );
  }

  void signInGoogle() async {
    observable.onLoading();
    final Result<UserCredential> res = await _repository.signInWithGoogle();
    res.map(
      success: (success) => observable.onSuccess(success.data),
      error: (error) => observable.onError(error.message),
    );
  }

  void signOut() {
    _repository.signOut();
  }

  @override
  Future<void> close() async {
    _reactionDisposer();
    super.close();
  }
}
