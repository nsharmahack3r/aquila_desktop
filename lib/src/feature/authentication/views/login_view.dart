import 'package:animate_do/animate_do.dart';
import 'package:aquila/src/feature/authentication/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late final _authController = ref.read(authControllerProvider.notifier);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeInDown(
                  child: const Text(
                    "Aquila",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Please Login to continue",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Consumer(builder: (context, ref, child) {
                  final laoding = ref.watch(authControllerProvider);

                  if (laoding) {
                    return const SizedBox(
                      height: 60,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  return SizedBox(
                    height: 60,
                    child: MaterialButton(
                      padding: const EdgeInsets.all(24.0),
                      color: Colors.deepPurple,
                      onPressed: () {
                        _authController.login(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context,
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
