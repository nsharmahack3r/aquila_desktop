import 'package:aquila/src/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserProvider = StateProvider<User?>((ref) => null);
final authTokenProvider = StateProvider<String?>((ref) => null);
