import 'package:flappwrite_tracker/features/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const String name = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
          child: Column(
        children: [
          const Text('Welcome to FlAppwrite Tracker'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(SignupScreen.name);
            },
            child: const Text('Create account'),
          ),
        ],
      )),
    );
  }
}
