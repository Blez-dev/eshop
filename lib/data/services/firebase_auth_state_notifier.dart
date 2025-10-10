import 'package:eshop/data/services/sign_in_state_Controller.dart';
import 'package:eshop/presentation/onboarding/controller/auth_controller_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import '../models/auth_state.dart';
import '../repository/firebase_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  static bool success = false;
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState());

  // 🔹 Signup
  Future<User?> signup(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = state.copyWith(isLoading: true, error: null, message: null);
    try {
      final user = await _authRepository.signup(email, password, context);
      state = state.copyWith(
        isLoading: false,
        user: user,
        message: "Signup successful",
      );


      return user;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return null;
    }
  }

  Future<void> forgotPassword(String email, BuildContext context) async {
    state = state.copyWith(isLoading: true, error: null, message: null);
    try {
      final user = await _authRepository.sendPasswordResetEmail(email, context);
      state = state.copyWith(isLoading: false, message: "Signup successful");
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return null;
    }
  }

  // 🔹 Signin
  Future<User?> signin(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = state.copyWith(isLoading: true, error: null, message: null);
    try {
      final user = await _authRepository.signin(email, password, context);
      state = state.copyWith(
        isLoading: false,
        user: user,
        message: "Login successful ✅",
      );
      AuthController.setLoginState("isLoggedIn", true);
      return user;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return null;
    }
  }

  // 🔹 Signout
  Future<void> signout() async {
    state = state.copyWith(isLoading: true, error: null, message: null);
    try {
      await _authRepository.signout();
      state = state.copyWith(
        isLoading: false,
        user: null,
        message: "Signed out successfully 👋",
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // 🔹 Forgot Password
  Future<void> resetPassword(String email, BuildContext context) async {
    state = state.copyWith(isLoading: true, error: null, message: null);
    try {
      await _authRepository.sendPasswordResetEmail(email, context);
      state = state.copyWith(
        isLoading: false,
        message: "Password reset email sent 📧",
      );
      success = true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return AuthNotifier(repo);
});
