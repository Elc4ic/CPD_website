
import '../auth_data.dart';
import 'oauth.dart';

class SimpleAuth {
  SimpleAuth(
      {required this.baseUrl,
      required this.getAuthData,
      this.responseType,
      this.otherQueryParams});

  final String baseUrl;
  final String? responseType;
  final Map<String, String>? otherQueryParams;

  final Function getAuthData;

  Future<bool> authenticate(
      {required String clientID,
      String? clientSecret,
      required Function onDone,
      bool newSession = false}) {

    final OAuth oAuth = OAuth(
      baseUrl: baseUrl,
      clientID: clientID,
      clientSecret: clientSecret,
      responseType: responseType,
      otherQueryParams: otherQueryParams,
    );

    return oAuth.authenticate(
      clearCache: newSession,
      onDone: (responseData) async {
        final String token = responseData[OAuth.TOKEN_KEY];
        final String code = responseData[OAuth.CODE_KEY];

        AuthData authData = token == null && code == null
            ? AuthData(response: responseData)
            : await getAuthData(responseData);

        onDone(authData);
      },
    );
  }
}
