import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/auth/auth_repository.dart';
import '../../domain/model/result.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Logger logger;

  AuthRepositoryImpl(this.logger);

  @override
  Future<Result<UserCredential>> signIn(String email, String password) async {
    try {
      final res = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(data: res);
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      return Result.error(message: e.message);
    }
  }

  @override
  Future<Result<UserCredential>> signUp(String email, String password) async {
    try {
      final res = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(data: res);
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      return Result.error(message: e.message);
    }
  }

  @override
  Future<Result<UserCredential>> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        final res = await auth.signInWithPopup(googleProvider);
        return Result.success(data: res);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        final res = await auth.signInWithCredential(credential);
        return Result.success(data: res);
      }
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      return Result.error(message: e.message);
    } on Exception catch (e) {
      logger.e(e.toString());
      return Result.error(message: e.toString());
    }
  }

  @override
  void signOut() async {
    try {
      await auth.signOut();
    } on Exception catch (e) {
      logger.e(e.toString());
    }
  }
}
