import 'package:aquila/src/feature/recruiter/repository/endpoints.dart';
import 'package:aquila/src/model/recruiter.dart';
import 'package:aquila/src/network/app_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recruiterRepositoryProvider = Provider((ref) => RecruiterRepository(
      network: ref.read(networkProvider),
    ));

class RecruiterRepository {
  final AppNetwork _appNetwork;
  RecruiterRepository({required AppNetwork network}) : _appNetwork = network;

  Future<List<Recruiter>?> getAllRecruiters() async {
    final result =
        await _appNetwork.getRequest(url: RecruiterEndpoints.recruiter);
    return result.fold(
      (failure) {
        return null;
      },
      (response) {
        final data = response.data;
        final List recruitersJson = data['data'];
        return recruitersJson.map((e) => Recruiter.fromMap(e)).toList();
      },
    );
  }

  Future<Recruiter?> createRecruiter({
    required String email,
    required String name,
    required String location,
  }) async {
    final result = await _appNetwork.postRequest(
      url: RecruiterEndpoints.recruiter,
      body: {
        'email': email,
        'name': name,
        'location': location,
      },
    );

    return result.fold((failure) {
      return null;
    }, (response) {
      final data = response.data;
      final recruiterJson = data['data'];

      return Recruiter.fromMap(recruiterJson);
    });
  }

  Future<Recruiter?> updateRecruiter({
    required String email,
    required String name,
    required String location,
    required String id,
  }) async {
    final result = await _appNetwork.putRequest(
      url: RecruiterEndpoints.updateRecruiter(id),
      body: {
        'email': email,
        'name': name,
        'location': location,
      },
    );

    return result.fold((failure) {
      return null;
    }, (response) {
      final data = response.data;
      final recruiterJson = data['data'];

      return Recruiter.fromMap(recruiterJson);
    });
  }

  Future<bool> deleteRecruiter({required String id}) async {
    final result = await _appNetwork.deleteRequest(
      url: RecruiterEndpoints.updateRecruiter(id),
      body: {},
    );

    return result.fold((failure) {
      return false;
    }, (response) {
      final data = response.data;
      return data['success'];
    });
  }
}
