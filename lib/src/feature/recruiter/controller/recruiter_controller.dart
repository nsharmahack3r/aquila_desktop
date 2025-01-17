// ignore_for_file: use_build_context_synchronously

import 'package:aquila/src/feature/recruiter/controller/recruiter_home_controller.dart';
import 'package:aquila/src/feature/recruiter/repository/recruiter_repository.dart';
import 'package:aquila/src/model/recruiter.dart';
import 'package:aquila/src/utils/info_messenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recruiterControllerProvider =
    StateNotifierProvider<RecruiterController, bool>(
  (ref) => RecruiterController(
    recruiterRepository: ref.watch(recruiterRepositoryProvider),
    ref: ref,
  ),
);

class RecruiterController extends StateNotifier<bool> {
  final RecruiterRepository _recruiterRepository;
  final Ref _ref;

  RecruiterController({
    required RecruiterRepository recruiterRepository,
    required Ref ref,
  })  : _recruiterRepository = recruiterRepository,
        _ref = ref,
        super(false);

  // creating new recruiter

  Future<Recruiter?> createRecruiter({
    required String name,
    required String email,
    required String location,
    required BuildContext context,
  }) async {
    if (state) {
      return null;
    }

    state = true;

    final result = await _recruiterRepository.createRecruiter(
      name: name,
      email: email,
      location: location,
    );

    if (result != null) {
      _ref
          .read(recruiterHomeControllerProvider.notifier)
          .addNewRecruiter(newRecruiter: result);

      _ref
          .read(recruiterHomeControllerProvider.notifier)
          .setFocusedRecruiter(result);

      InfoMessenger.showSuccess(
          context: context,
          description: "$name, $location",
          title: "Recruiter Created");

      state = false;
      return result;
    }

    state = false;
    InfoMessenger.showError(
      context: context,
      description: "$name, $location",
      title: "Failed to Add Recruiter",
    );

    return null;
  }

  void showMessage(BuildContext context) {
    InfoMessenger.showInfo(
      context: context,
      description: "Info",
      title: "Info",
    );
  }

  Future<Recruiter?> updateRecruiter({
    required String name,
    required String email,
    required String location,
    required BuildContext context,
  }) async {
    if (state) {
      return null;
    }

    state = true;

    final result = await _recruiterRepository.updateRecruiter(
      name: name,
      email: email,
      location: location,
      id: _ref.read(
        recruiterHomeControllerProvider
            .select((state) => state.focusedRecruiter!.id),
      ),
    );

    if (result != null) {
      _ref
          .read(recruiterHomeControllerProvider.notifier)
          .updateRecruiter(updatedRecuiter: result);

      InfoMessenger.showInfo(
          context: context,
          description: "$name, $location",
          title: "Recruiter Updated");

      state = false;
      return result;
    }

    state = false;
    InfoMessenger.showError(
      context: context,
      description: "$name, $location",
      title: "Failed to Update Recruiter",
    );

    return null;
  }

  Future<void> deleteRecruiter(BuildContext context) async {
    final id = _ref.read(recruiterHomeControllerProvider
        .select((state) => state.focusedRecruiter!.id));

    final success = await _recruiterRepository.deleteRecruiter(id: id);

    if (success) {
      _ref.read(recruiterHomeControllerProvider.notifier);

      InfoMessenger.showInfo(
        context: context,
        description: "",
        title: "Recruiter Deleted",
      );

      _ref.read(recruiterHomeControllerProvider.notifier).removeRecruiter();
    } else {
      InfoMessenger.showError(
        context: context,
        description: "",
        title: "Failed to Delete Recruiter",
      );
    }
  }

  // removing a recruite
  // updating a recruiter
}
