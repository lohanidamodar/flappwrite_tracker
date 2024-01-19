import 'package:flappwrite_tracker/auth_notifier/auth_notifier.dart';
import 'package:flappwrite_tracker/auth_notifier/src/auth_state.dart';
import 'package:flappwrite_tracker/dashboard/dashboard.dart';
import 'package:flappwrite_tracker/features/login_screen/login_screen.dart';
import 'package:flappwrite_tracker/features/signup_screen/signup_screen.dart';
import 'package:flappwrite_tracker/home_page/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);
    return GoRouter(
      initialLocation: '/dashboard',
      routes: [
        GoRoute(
          name: HomePage.name,
          path: '/',
          builder: (_, __) => const HomePage(),
        ),
        GoRoute(
            name: Dashboard.name,
            path: '/dashboard',
            builder: (_, __) => const Dashboard()),
        GoRoute(
          path: '/signup',
          name: SignupScreen.name,
          builder: (_, __) {
            return SignupScreen(onSignup: (name, email, password) async {
              await authNotifier.signup(name, email, password);
            });
          },
        ),
        GoRoute(
          path: '/login',
          name: LoginScreen.name,
          builder: (_, __) {
            return LoginScreen(onLogin: (email, password) async {
              await authNotifier.login(email, password);
            });
          },
        ),
      ],
      redirect: (context, state) {
        final location = state.matchedLocation;
        if (location == '/login' || location == '/signup' || location == '/') {
          if (authState.status == AuthStatus.authenticated) {
            return '/dashboard';
          }
        }
        if (location == '/dashboard' &&
            authState.status != AuthStatus.authenticated) {
          return '/';
        }
        return null;
      },
    );
  },
);
