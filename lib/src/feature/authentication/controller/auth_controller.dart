// ignore_for_file: use_build_context_synchronously

import 'package:aquila/src/app_wrapper.dart';
import 'package:aquila/src/common/providers/providers.dart';
import 'package:aquila/src/feature/authentication/repository/auth_repository.dart';
import 'package:aquila/src/local/shared_prefs.dart';
import 'package:aquila/src/model/auth.dart';
import 'package:aquila/src/utils/info_messenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    ref: ref,
    authRepository: ref.watch(authRepositoryProvider),
  ),
);

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({
    required AuthRepository authRepository,
    required Ref ref,
  })  : _authRepository = authRepository,
        _ref = ref,
        super(false);

  Future<void> login({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    state = true;
    final auth = await _authRepository.login(email: email, password: password);

    if (auth == null) {
      state = false;
      if (context != null) {
        InfoMessenger.showError(
          context: context,
          description: "Failed to login",
          title: "Authentication Failed",
        );
      }
      return;
    }

    if (context != null) {
      InfoMessenger.showSuccess(
        context: context,
        description: "Hello User!",
        title: "Authenticated",
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const AppWrapper(),
        ),
      );
    }

    _saveAuthState(auth);

    state = false;
  }

  _saveAuthState(Auth auth) {
    _ref.read(currentUserProvider.notifier).update((state) => auth.user);
    _ref.read(authTokenProvider.notifier).update((state) => auth.token);

    _ref.read(sharedPrefs).saveToken(auth.token);
    _ref.read(sharedPrefs).saveUser(auth.user);
  }
}
