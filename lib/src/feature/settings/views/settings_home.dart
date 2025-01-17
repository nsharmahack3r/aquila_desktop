import 'package:aquila/src/feature/authentication/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsHome extends ConsumerWidget {
  const SettingsHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).logout();
              //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const SplashView()));
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
