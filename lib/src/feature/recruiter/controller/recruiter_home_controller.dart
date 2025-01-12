// ignore_for_file: use_build_context_synchronously

import 'package:aquila/src/feature/recruiter/repository/recruiter_repository.dart';
import 'package:aquila/src/feature/recruiter/state/recruiter_home_state.dart';
import 'package:aquila/src/utils/info_messenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recruiterHomeControllerProvider =
    StateNotifierProvider<RecruiterHomeController, RecruiterHomeState>(
  (ref) => RecruiterHomeController(
    recruiterRepository: ref.watch(recruiterRepositoryProvider),
  ),
);

class RecruiterHomeController extends StateNotifier<RecruiterHomeState> {
  final RecruiterRepository _recruiterRepository;

  RecruiterHomeController({
    required RecruiterRepository recruiterRepository,
  })  : _recruiterRepository = recruiterRepository,
        super(RecruiterHomeState.initial());

  Future<void> getAllRecruiters({BuildContext? context}) async {
    state = state.copyWith(loading: true);
    final recruiters = await _recruiterRepository.getAllRecruiters();

    if (recruiters == null) {
      state = state.copyWith(error: true, loading: false);
      if (context != null) {
        InfoMessenger.showError(
          context: context,
          description: "Failed to get recruiters",
          title: "Recuiter Error",
        );
      }
      return;
    }
    state = state.copyWith(recruiters: recruiters, loading: false);
  }

  void retry({BuildContext? context}) {
    state = state.copyWith(error: false, loading: false);
    getAllRecruiters(context: context);
  }
}
