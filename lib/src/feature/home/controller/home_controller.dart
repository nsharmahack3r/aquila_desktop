// ignore_for_file: use_build_context_synchronously

import 'package:aquila/src/feature/home/repository/home_repository.dart';
import 'package:aquila/src/feature/home/state/home_state.dart';
import 'package:aquila/src/utils/info_messenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(repository: ref.watch(homeRepositoryProvider)),
);

class HomeController extends StateNotifier<HomeState> {
  final HomeRepository _repository;

  HomeController({
    required HomeRepository repository,
  })  : _repository = repository,
        super(HomeState.initial());

  Future<void> getHomeStats({BuildContext? context}) async {
    if (state.loading || state.error) return;

    state = state.copyWith(loading: true);
    final stats = await _repository.getHomeStats();
    if (stats == null) {
      state = state.copyWith(error: true, loading: false);
      if (context != null) {
        InfoMessenger.showError(
          context: context,
          description: "Failed to load dashboard",
          title: "Home Error",
        );
      }
      return;
    }

    state = state.copyWith(stats: stats, loading: false);
  }
}
