import 'package:flutter/material.dart';

import 'types.dart';

class LoginForm extends StatelessWidget {
  final LoginCallback onPressedLogin;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.onPressedLogin,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Login'),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(label: Text('email')),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(label: Text('password')),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => onPressedLogin(
              emailController.text,
              passwordController.text,
            ),
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}
