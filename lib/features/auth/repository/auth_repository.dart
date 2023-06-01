import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/enums.dart';
import '../../../common/helpers/auth_exception_helper.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(auth: FirebaseAuth.instance),
);

class AuthRepository {
  final FirebaseAuth auth;
  AuthRepository({
    required this.auth,
  });

  Future<AuthResultStatus> createAccount(email, password) async {
    AuthResultStatus status;
    try {
      var authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (authResult.user != null) {
        status = AuthResultStatus.successful;
      } else {
        status = AuthResultStatus.undefined;
      }
    } on FirebaseAuthException catch (e) {
      status = AuthExceptionHandler.handleException(e.message);
    }
    return status;
  }

  Future<AuthResultStatus> login(email, password) async {
    AuthResultStatus status;
    try {
      final authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (authResult.user != null) {
        status = AuthResultStatus.successful;
      } else {
        status = AuthResultStatus.undefined;
      }
    } on FirebaseAuthException catch (e) {
      status = AuthExceptionHandler.handleException(e.message);
    }
    return status;
  }

  Future<void> sendForgotPasswordEmail(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      e.toString();
    }
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      e.toString();
    }
  }
  Future<void> deleteAccount()async{
   try {
      await auth.currentUser!.delete();
    } catch (e) {
      e.toString();
    }
  }
}
