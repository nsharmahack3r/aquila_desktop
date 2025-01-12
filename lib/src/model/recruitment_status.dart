// ignore_for_file: constant_identifier_names

enum RecruitmentStatus {
  SHARED,
  INTERVIEW_SCHEDULED,
  ACCEPTED,
  REJECTED,
  UNKNOWN;
  
  @override
  String toString() {
    switch (this) {
      case SHARED:
        return 'SHARED';
      case INTERVIEW_SCHEDULED:
        return 'INTERVIEW_SCHEDULED';
      case ACCEPTED:
        return 'ACCEPTED';
      case REJECTED:
        return 'REJECTED';
      case UNKNOWN:
        return 'UNKNOWN';
    }
  }

  static RecruitmentStatus fromString(String value) {
    switch (value) {
      case 'SHARED':
        return SHARED;
      case 'INTERVIEW_SCHEDULED':
        return INTERVIEW_SCHEDULED;
      case 'ACCEPTED':
        return ACCEPTED;
      case 'REJECTED':
        return REJECTED;
      case 'UNKNOWN':
        return UNKNOWN;
      default:
        return UNKNOWN;
    }
  }
}