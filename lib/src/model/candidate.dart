// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Candidate({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.status,
    required this.role,
    required this.experience,
    required this.location,
    this.recruiter,
    required this.candidateStatus,
    required this.recruitmentStatus,
  });

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'status': status,
      'role': role,
      'experience': experience,
      'location': location,
      'recruiter': recruiter?.toMap(),
      'candidateStatus': candidateStatus.toString(),
      'recruitmentStatus': recruitmentStatus.toString(),
    };
  }

  factory Candidate.fromMap(Map<String, dynamic> map) {
    return Candidate(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] != null ? map['phone'] as String : null,
      status: map['status'] as dynamic,
      role: map['role'] as String,
      experience: map['experience'] as int,
      location: map['location'] as String,
      recruiter: map['recruiter'] != null
          ? Recruiter.fromMap(map['recruiter'] as Map<String, dynamic>)
          : null,
      candidateStatus: CandidateStatus.fromString(map['candidateStatus']),
      recruitmentStatus: RecruitmentStatus.fromString(map['recruitmentStatus']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Candidate.fromJson(String source) =>
      Candidate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Candidate(id: $id, name: $name, email: $email, phone: $phone, status: $status, role: $role, experience: $experience, location: $location, recruiter: $recruiter, candidateStatus: $candidateStatus, recruitmentStatus: $recruitmentStatus)';
  }

  @override
  bool operator ==(covariant Candidate other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.status == status &&
        other.role == role &&
        other.experience == experience &&
        other.location == location &&
        other.recruiter == recruiter &&
        other.candidateStatus == candidateStatus &&
        other.recruitmentStatus == recruitmentStatus;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        status.hashCode ^
        role.hashCode ^
        experience.hashCode ^
        location.hashCode ^
        recruiter.hashCode ^
        candidateStatus.hashCode ^
        recruitmentStatus.hashCode;
  }
}
