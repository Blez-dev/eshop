import 'package:firebase_auth/firebase_auth.dart';

class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;
  final String? message;

  AuthState({
    this.isLoading = false,
    this.user,
    this.error,
    this.message,
  });

  AuthState copyWith({
    bool? isLoading,
    User? user,
    String? error,
    String? message,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
      message: message,
    );
  }
}
