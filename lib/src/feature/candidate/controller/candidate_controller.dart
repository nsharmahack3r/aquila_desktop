// ignore_for_file: use_build_context_synchronously

import 'package:aquila/src/feature/candidate/repository/candidate_repository.dart';
import 'package:aquila/src/model/candidate.dart';
import 'package:aquila/src/utils/info_messenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final candidateControllerProvider =
    StateNotifierProvider<CandidateController, bool>((ref) {
  final repository = ref.watch(candidateRepositoryProvider);
  return CandidateController(ref: ref, repository: repository);
});

class CandidateController extends StateNotifier<bool> {
  final Ref _ref;
  final CandidateRepository _repository;

  CandidateController({
    required Ref ref,
    required CandidateRepository repository,
  })  : _ref = ref,
        _repository = repository,
        super(false);

  Future<Candidate?> createCandidate({
    required String name,
    required String email,
    required String phone,
    required String role,
    required String location,
    required int experience,
    required BuildContext context,
  }) async {
    final result = await _repository.createCandidate(
      name: name,
      email: email,
      phone: phone,
      role: role,
      location: location,
      experience: experience,
    );

    if (result == null) {
      InfoMessenger.showSuccess(
        context: context,
        description: "Candidate Added Successfully",
        title: "$name, $role, $location",
      );
    } else {
      InfoMessenger.showError(
        context: context,
        description: "Failed to add candidate",
        title: "$name, $role, $location",
      );
    }

    return result;
  }
}
