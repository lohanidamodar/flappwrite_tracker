import 'package:flappwrite_tracker/appwrite/appwrite.dart';
import 'package:flappwrite_tracker/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
