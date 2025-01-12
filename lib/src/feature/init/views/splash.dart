import 'package:animate_do/animate_do.dart';
import 'package:aquila/src/app_wrapper.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(initController).initUser().then((isAuth) async {
        await Future.delayed(const Duration(seconds: 2));
        if (isAuth) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const AppWrapper(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginView(),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: FadeIn(
        child: const Text(
          "Aquila",
          style: TextStyle(fontSize: 48, color: Colors.white),
        ),
      )),
    );
  }
}
