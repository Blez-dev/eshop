import 'package:eshop/presentation/components/toast_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  // 🔹 Signup method
  Future<User?> signup(String email, String password,BuildContext context) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {

      ToastHelper.error(context, e.message!);
      throw Exception(e.message);
    }
  }

  // 🔹 Signin method
  Future<User?> signin(String email, String password,BuildContext context) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      ToastHelper.error(context, e.message!);
      throw Exception(e.message);

    }
  }

  // 🔹 Signout method
  Future<void> signout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // 🔹 Forgot Password (Password Reset)
  Future<void> sendPasswordResetEmail(String email,BuildContext context) async {
    if(email.isEmpty){
      ToastHelper.error(context, "Input field cant be empty");
    }else{
      try {
        await _auth.sendPasswordResetEmail(email: email);
      } on FirebaseAuthException catch (e) {
        ToastHelper.error(context, e.message!);
        throw Exception(e.message);
      }
    }

  }
}

// Riverpod provider for AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance);
});
