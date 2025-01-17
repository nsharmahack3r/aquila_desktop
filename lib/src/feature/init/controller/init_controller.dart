import 'package:aquila/src/common/providers/providers.dart';
import 'package:aquila/src/local/shared_prefs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initController = Provider((ref) => InitController(ref: ref));

class InitController {
  final Ref _ref;

  InitController({required Ref ref}) : _ref = ref;

  void init() {}

  Future<bool> initUser() async {
    final user = await _ref.read(sharedPrefs).getUser();
    final token = await _ref.read(sharedPrefs).getToken();

    _ref.read(currentUserProvider.notifier).update((state) => user);
    _ref.read(authTokenProvider.notifier).update((state) => token);

    await Future.delayed(const Duration(seconds: 2));

    return user != null && token != null;
  }
}
