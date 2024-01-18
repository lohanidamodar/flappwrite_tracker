import 'package:appwrite/appwrite.dart';
import 'package:flappwrite_tracker/appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'auth_state.dart';
import 'user.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState(status: AuthStatus.loading)) {
    authenticate();
  }

  final authProvider = GetIt.I.get<Appwrite>();

  authenticate() async {
    try {
      final user = await authProvider.getAccount();
      state = state.copyWith(
          user: User.fromMap( user!.toMap()), error: null, status: AuthStatus.authenticated);
    } on AppwriteException catch (e) {
      state = state.copyWith(
          error: e.message, user: null, status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(
          error: e.toString(), user: null, status: AuthStatus.unauthenticated);
    }
  }


  logout() async {
    try {
      await authProvider.logout();
      state = state.copyWith(
          error: null, user: null, status: AuthStatus.unauthenticated);
    } on AppwriteException catch (e) {
      state = state.copyWith(error: e.message);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  login(String email, String password) async {
    try {
      await authProvider.createEmailSession(email, password);
      authenticate();
    } on AppwriteException catch (e) {
      state = state.copyWith(
          error: e.message, user: null, status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(
          error: e.toString(), user: null, status: AuthStatus.unauthenticated);
    }
  }

  signup(String name, String email, String password) async {
    try {
      state = state.copyWith(status: AuthStatus.loading);
      await authProvider.createAccount(name, email, password);
      login(email, password);
    } on AppwriteException catch (e) {
      state = state.copyWith(
          error: e.message, user: null, status: AuthStatus.unauthenticated);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
