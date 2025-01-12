import 'package:aquila/src/model/candidate_status.dart';
import 'package:aquila/src/model/recruiter.dart';
import 'package:aquila/src/model/recruitment_status.dart';

class Candidate {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final dynamic status;
  final String role;
  final int experience;
  final String location;
  final Recruiter? recruiter;
  final CandidateStatus candidateStatus;
  final RecruitmentStatus recruitmentStatus;

  Candidate({required this.id, required this.name, required this.email, required this.phone, required this.status, required this.role, required this.experience, required this.location, required this.recruiter, required this.candidateStatus, required this.recruitmentStatus});

  Candidate copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    dynamic status,
    String? role,
    int? experience,
    String? location,
    Recruiter? recruiter,
    CandidateStatus? candidateStatus,
    RecruitmentStatus? recruitmentStatus,
  }) {
    return Candidate(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      role: role ?? this.role,
      experience: experience ?? this.experience,
      location: location ?? this.location,
      recruiter: recruiter ?? this.recruiter,
      candidateStatus: candidateStatus ?? this.candidateStatus,
      recruitmentStatus: recruitmentStatus ?? this.recruitmentStatus,
    );
  }
}
