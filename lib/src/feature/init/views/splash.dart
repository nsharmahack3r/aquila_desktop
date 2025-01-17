import 'package:animate_do/animate_do.dart';
import 'package:aquila/src/app_wrapper.dart';
import 'package:aquila/src/common/providers/providers.dart';
import 'package:aquila/src/feature/authentication/views/login_view.dart';
import 'package:aquila/src/feature/init/controller/init_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: FutureBuilder(
          future: ref.read(initController).initUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Consumer(
                builder: (context, ref, child) {
                  final user = ref.watch(currentUserProvider);
                  final token = ref.watch(authTokenProvider);
                  if (user != null && token != null) {
                    return const AppWrapper();
                  }
                  return const LoginView();
                },
              );
            }
            
            return Center(
                child: FadeIn(
              child: const Text(
                "Aquila",
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
            ));
          }),
    );
  }
}
