import 'package:firebase_auth/firebase_auth.dart';

import '../model/result.dart';

abstract class AuthRepository {
  Future<Result<UserCredential>> signIn(String email, String password);

  Future<Result<UserCredential>> signUp(String email, String password);

  Future<Result<UserCredential>> signInWithGoogle();

  void signOut();
}
