import 'package:flutter/material.dart';

import 'types.dart';
import 'login_form.dart';

class LoginScreen extends StatefulWidget {
  static const String name = 'login';
  final LoginCallback onLogin;
  const LoginScreen({
    super.key,
    required this.onLogin,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          LoginForm(
            onPressedLogin: widget.onLogin,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
        ],
      ),
    );
  }
}
