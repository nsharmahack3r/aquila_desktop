import 'package:aquila/src/feature/candidate/repository/candidate_endpoints.dart';
import 'package:aquila/src/model/candidate.dart';
import 'package:aquila/src/network/app_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final candidateRepositoryProvider = Provider((ref) {
  final appNetwork = ref.watch(networkProvider);
  return CandidateRepository(appNetwork: appNetwork);
});

class CandidateRepository {
  final AppNetwork _appNetwork;

  CandidateRepository({required AppNetwork appNetwork})
      : _appNetwork = appNetwork;

  Future<Candidate?> createCandidate({
    required String name,
    required String email,
    required String phone,
    required String role,
    required String location,
    required int experience,
  }) async {
    final data = {
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'location': location,
      'experience': experience,
    };

    final result = await _appNetwork.postRequest(
      url: CandidateEndpoints.candidate,
      body: data,
    );

    return result.fold(
      (failure) {
        return null;
      },
      (response) {
        final data = response.data;
        final candidateJson = data['data'];
        return Candidate.fromMap(candidateJson);
      },
    );
  }

  Future<List<Candidate>?> getAllCandidates({
    required int page,
    int limit = 20,
  }) async {}
}
