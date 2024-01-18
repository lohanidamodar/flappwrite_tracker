import 'package:flappwrite_tracker/features/signup_screen/signup_screen.dart';
import 'package:flappwrite_tracker/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
      name: HomePage.name,
      path: '/',
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
        path: '/signup',
        name: SignupScreen.name,
        builder: (_, __) {
          return SignupScreen(onSignup: (name, email, password) {
            debugPrint('$name - $email - $password');
          });
        })
  ]);
});
