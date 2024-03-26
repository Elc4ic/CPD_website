import 'dart:collection';
import 'package:url_launcher/url_launcher.dart';

class OAuth {
  OAuth(
      {required this.baseUrl,
      required this.clientID,
      this.clientSecret,
      this.responseType,
      this.otherQueryParams});

  final String baseUrl;
  final String clientID;
  final String? clientSecret;
  String? responseType;
  final Map<String, String>? otherQueryParams;

  static const String TOKEN_KEY = 'access_token'; // OAuth token key
  static const String CODE_KEY = 'code'; // OAuth code key
  static const String STATE_KEY = 'state'; // OAuth state key
  static const String SCOPE_KEY = 'scope'; // OAuth scope key
  static const String CLIENT_ID_KEY = 'clientID'; // custom client id key
  static const String CLIENT_SECRET_KEY =
      'clientSecret'; // custom client secret key
  static const String REDIRECT_URI_KEY =
      'redirectURI'; // custom redirect uri key

  Future<bool> authenticate(
      {required Function onDone, bool clearCache = false}) {
    String clientSecretQuery =
        clientSecret != null ? '&client_secret=$clientSecret' : '';
    String otherParams = '';

    if (otherQueryParams != null) {
      for (String key in otherQueryParams!.keys) {
        otherParams += '&$key=${otherQueryParams?[key]}';
      }
    }

    ///https://oauth.yandex.ru/authorize?response_type=code&client_id=20c3edc785134bd085e271896b750a4d&scope=login:email%20login:info%20login:birthday&redirect_uri=https%3A%2F%2Fok.ru%2Fweb-api%2FyandexAuth&state=43xYbQH026i5L9iHH00qpGJA5RYjjyB76H3RJ4Izozs
    String authUrl = '$baseUrl'
        'client_id=$clientID'
        '$clientSecretQuery'
        '$otherParams';

    return launchUrl(Uri.parse(authUrl));
  }

  Map<String, String> _getQueryParams(String url) {
    final List<String> urlParams = url.split(RegExp('[?&# ]'));
    final Map<String, String> queryParams = HashMap();
    List<String> parts;

    for (String param in urlParams) {
      if (!param.contains('=')) continue;

      parts = param.split('=');
      queryParams[parts[0]] = Uri.decodeFull(parts[1]);
    }

    return queryParams;
  }
}
