// ignore_for_file: constant_identifier_names

enum CandidateStatus {
  ACTIVE,
  INACTIVE;

  @override
  String toString() {
    switch (this) {
      case CandidateStatus.ACTIVE:
        return 'ACTIVE';
      case CandidateStatus.INACTIVE:
        return 'INACTIVE';
    }
  }
  
  static CandidateStatus fromString(String status) {
    switch (status) {
      case 'ACTIVE':
        return CandidateStatus.ACTIVE;
      case 'INACTIVE':
        return CandidateStatus.INACTIVE;
      default:
        throw Exception('Invalid candidate status: $status');
    }
  }
}