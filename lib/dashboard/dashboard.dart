import 'package:flappwrite_tracker/auth_notifier/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends StatelessWidget {
  static const String name = 'dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Dashboard'),
          const SizedBox(height: 10.0),
          Consumer(builder: (context, ref, widget) {
            final authNotifier = ref.watch(authProvider.notifier);
            return ElevatedButton(
                onPressed: () async {
                  await authNotifier.logout();
                },
                child: const Text('Logout'));
          }),
        ],
      )),
    );
  }
}
