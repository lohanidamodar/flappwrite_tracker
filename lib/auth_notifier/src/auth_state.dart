import 'user.dart';

class AuthState {
  final User? user;
  final AuthStatus status;
  final String? error;

  AuthState({
    this.user,
    this.error,
    required this.status,
  });

  AuthState copyWith({
    User? user,
    AuthStatus? status,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

enum AuthStatus { loading, authenticating, authenticated, unauthenticated }
