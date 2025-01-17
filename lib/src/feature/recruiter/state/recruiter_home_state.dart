import 'package:aquila/src/model/recruiter.dart';

class RecruiterHomeState {
  final List<Recruiter> recruiters;
  final bool loading;
  final bool error;
  final Recruiter? focusedRecruiter;

  RecruiterHomeState({
    required this.recruiters,
    required this.loading,
    required this.error,
    this.focusedRecruiter,
  });

  RecruiterHomeState copyWith({
    List<Recruiter>? recruiters,
    bool? loading,
    bool? error,
  }) {
    return RecruiterHomeState(
      recruiters: recruiters ?? this.recruiters,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      focusedRecruiter: focusedRecruiter,
    );
  }

  RecruiterHomeState setFocusedRecruiter(Recruiter? recruiter) =>
      RecruiterHomeState(
        recruiters: recruiters,
        loading: loading,
        error: error,
        focusedRecruiter: recruiter,
      );

  factory RecruiterHomeState.initial() => RecruiterHomeState(
        recruiters: [],
        loading: true,
        error: false,
      );
}
