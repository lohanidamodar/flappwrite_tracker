import 'package:flappwrite_tracker/home_page/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: [
    GoRoute(
        name: HomePage.name, path: '/', builder: (_, __) => const HomePage())
  ]);
});
