// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HomeStats {
  final int totalCandidates;
  final int totalRecruiters;
  final int activeCandidates;
  final int interviewCandidates;
  HomeStats({
    required this.totalCandidates,
    required this.totalRecruiters,
    required this.activeCandidates,
    required this.interviewCandidates,
  });

  HomeStats copyWith({
    int? totalCandidates,
    int? totalRecruiters,
    int? activeCandidates,
    int? interviewCandidates,
  }) {
    return HomeStats(
      totalCandidates: totalCandidates ?? this.totalCandidates,
      totalRecruiters: totalRecruiters ?? this.totalRecruiters,
      activeCandidates: activeCandidates ?? this.activeCandidates,
      interviewCandidates: interviewCandidates ?? this.interviewCandidates,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalCandidates': totalCandidates,
      'totalRecruiters': totalRecruiters,
      'activeCandidates': activeCandidates,
      'interviewCandidates': interviewCandidates,
    };
  }

  factory HomeStats.fromMap(Map<String, dynamic> map) {
    return HomeStats(
      totalCandidates: map['totalCandidates'] as int,
      totalRecruiters: map['totalRecruiters'] as int,
      activeCandidates: map['activeCandidates'] as int,
      interviewCandidates: map['interviewCandidates'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeStats.fromJson(String source) =>
      HomeStats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HomeStats(totalCandidates: $totalCandidates, totalRecruiters: $totalRecruiters, activeCandidates: $activeCandidates, interviewCandidates: $interviewCandidates)';
  }

  @override
  bool operator ==(covariant HomeStats other) {
    if (identical(this, other)) return true;

    return other.totalCandidates == totalCandidates &&
        other.totalRecruiters == totalRecruiters &&
        other.activeCandidates == activeCandidates &&
        other.interviewCandidates == interviewCandidates;
  }

  @override
  int get hashCode {
    return totalCandidates.hashCode ^
        totalRecruiters.hashCode ^
        activeCandidates.hashCode ^
        interviewCandidates.hashCode;
  }
}
