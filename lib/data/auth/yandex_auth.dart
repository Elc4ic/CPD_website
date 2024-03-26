import 'dart:convert';
import 'package:http/http.dart' as http;

import 'auth_data.dart';
import 'engine/oauth.dart';
import 'engine/simple_auth.dart';
import 'engine/visa.dart';

///yandex auth url example
///https://oauth.yandex.ru/authorize?response_type=code&client_id=20c3edc785134bd085e271896b750a4d&scope=login:email%20login:info%20login:birthday&redirect_uri=https%3A%2F%2Fok.ru%2Fweb-api%2FyandexAuth&state=43xYbQH026i5L9iHH00qpGJA5RYjjyB76H3RJ4Izozs

class YandexAuth extends Visa {

  final baseUrl = 'https://oauth.yandex.ru/authorize?response_type=code&';
  final Uri getJwtUrl = Uri.parse('https://login.yandex.ru/info?format=jwt');
  String personFields;

  @override
  SimpleAuth? visa;

  YandexAuth({this.personFields = ""}) {
    personFields = _getPersonFields(personFields);

    visa = SimpleAuth(
        baseUrl: baseUrl,

        getAuthData: (Map<String, String> oauthData) async {
          final String? token = oauthData[OAuth.TOKEN_KEY];

          final http.Response profileResponse = await http
              .get(getJwtUrl, headers: {'Authorization': 'OAuth $token'});
          final Map<String, dynamic> profileJson =
          json.decode(profileResponse.body);

          return authData(profileJson, oauthData);
        }, responseType: '', otherQueryParams: {});
  }

  @override
  AuthData authData(
      Map<String, dynamic> profileJson, Map<String, String> oauthData) {
    final String accessToken = oauthData[OAuth.TOKEN_KEY]!;

    return AuthData(
        clientID: oauthData['clientID'],
        accessToken: accessToken,
        userID: profileJson['metadata']['sources'][0]['id'],
        firstName: profileJson['names'][0]['givenName'],
        lastName: profileJson['names'][0]['familyName'],
        email: profileJson['emailAddresses'][0]['value'],
        profileImgUrl: profileJson['photos'][0]['url'],
        response: oauthData,
        userJson: profileJson);
  }

  _getPersonFields(String fields) {
    final Set inputFields = Set.from(fields.split(RegExp('[ ,]')));
    final Set defaultFields = {'names', 'emailAddresses', 'metadata', 'photos'};

    defaultFields.addAll(inputFields);

    return defaultFields.join(',');
  }
}