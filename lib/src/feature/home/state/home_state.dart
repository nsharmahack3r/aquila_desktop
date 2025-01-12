// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aquila/src/model/home_stats.dart';

class HomeState {
  final bool loading;
  final bool error;
  final HomeStats stats;
  HomeState({
    required this.loading,
    required this.error,
    required this.stats,
  });

  HomeState copyWith({
    bool? loading,
    bool? error,
    HomeStats? stats,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      stats: stats ?? this.stats,
    );
  }

  factory HomeState.initial() {
    return HomeState(
      loading: false,
      error: false,
      stats: HomeStats(
        totalCandidates: 0,
        totalRecruiters: 0,
        activeCandidates: 0,
        interviewCandidates: 0,
      ),
    );
  }
}
