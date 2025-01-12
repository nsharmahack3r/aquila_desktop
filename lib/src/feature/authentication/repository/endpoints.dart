import 'package:aquila/src/constants/endpoints.dart';

class AuthEndpoints {
  static const _base = BaseEndpoints.baseUrl;

  static const String login = "$_base/auth/login";
  static const String signup = "$_base/auth/signup";
}
