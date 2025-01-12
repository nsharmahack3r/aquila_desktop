import 'package:aquila/src/feature/authentication/repository/endpoints.dart';
import 'package:aquila/src/model/auth.dart';
import 'package:aquila/src/model/user.dart';
import 'package:aquila/src/network/app_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider =
    Provider((ref) => AuthRepository(network: ref.read(networkProvider)));

class AuthRepository {
  final AppNetwork _network;
  AuthRepository({required AppNetwork network}) : _network = network;

  Future<Auth?> login({
    required String email,
    required String password,
  }) async {
    final result = await _network.postRequest(
      url: AuthEndpoints.login,
      body: {'email': email, 'password': password},
    );

    return result.fold((failure) {
      return null;
    }, (response) {
      final data = response.data;
      final userJson = data['user'];
      final user = User.fromMap(userJson);
      final authToken = data['token'];

      return Auth(token: authToken, user: user);
    });
  }

  Future<User?> signup({
    required String email,
    required String password,
  }) async {
    final result = await _network.postRequest(
      url: AuthEndpoints.signup,
      body: {'email': email, 'password': password},
    );

    return result.fold((failure) {
      return null;
    }, (response) {
      final data = response.data;
      final userJson = data['user'];
      return User.fromJson(userJson);
    });
  }
}
