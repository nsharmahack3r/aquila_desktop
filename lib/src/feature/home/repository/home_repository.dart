import 'package:aquila/src/feature/home/repository/endpoints.dart';
import 'package:aquila/src/model/home_stats.dart';
import 'package:aquila/src/network/app_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRepositoryProvider = Provider((ref) => HomeRepository(
      appNetwork: ref.read(networkProvider),
    ));

class HomeRepository {
  final AppNetwork _appNetwork;
  HomeRepository({required AppNetwork appNetwork}) : _appNetwork = appNetwork;

  Future<HomeStats?> getHomeStats() async {
    final response = await _appNetwork.getRequest(url: HomeEndpoints.home);
    return response.fold(
      (l) => null,
      (response) {
        final data = response.data;
        final homeStatsJson = data['data'];
        return HomeStats.fromMap(homeStatsJson);
      },
    );
  }
}
