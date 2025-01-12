import 'dart:convert';

import 'package:aquila/src/constants/shared_prefs_keys.dart';
import 'package:aquila/src/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefs = Provider((ref) => SharedPrefs());

class SharedPrefs {
  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefsKeys.USER_KEY, jsonEncode(user.toMap()));
  }

  Future<dynamic> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(SharedPrefsKeys.USER_KEY);
    if (userString == null) {
      return null;
    }

    final user = User.fromMap(jsonDecode(userString));
    return user;
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefsKeys.AUTH_TOKEN_KEY, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKeys.AUTH_TOKEN_KEY);
  }
}
