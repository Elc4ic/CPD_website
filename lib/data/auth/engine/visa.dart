
import '../auth_data.dart';
import 'simple_auth.dart';

abstract class Visa {
  SimpleAuth? visa;

  AuthData authData(
      Map<String, dynamic> userJson, Map<String, String> oauthData);
}