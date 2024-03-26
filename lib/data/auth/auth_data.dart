import 'dart:convert';

class AuthData {
  const AuthData({
    this.clientID,
    this.accessToken,
    this.firstName,
    this.lastName,
    this.userID,
    this.email,
    this.profileImgUrl,
    this.userJson,
    this.response,
  });

  final String? userID; // User's profile id
  final String? clientID; // OAuth client id
  final String? accessToken; // OAuth access token
  final String? firstName; // User's first name
  final String? lastName; // User's last name
  final String? email; // User's email
  final String? profileImgUrl; // User's profile image url
  final Map<String, dynamic>? userJson; // Full returned user json
  final Map<String, String>? response; // Full returned auth response.

  String _formatResponse() {
    StringBuffer result = StringBuffer('\n');

    for (MapEntry data in response!.entries) {
      result.write('\t\t\t\t');
      result.write(data.key);
      result.write(' = ');
      result.write(data.value);
      result.write('\n');
    }

    return result.toString();
  }

  String _formatJson() {
    return const JsonEncoder.withIndent('    ').convert(userJson);
  }

  @override
  String toString() {
    String responseString = _formatResponse();
    String prettyUserJson = _formatJson();

    return 'AuthData {\n\n'
        '\t\ttoken: $accessToken\n\n'
        '\t\tuser id: $userID\n\n'
        '\t\tfirst name: $firstName\n\n'
        '\t\tlast name: $lastName\n\n'
        '\t\temail: $email\n\n'
        '\t\tprofile image: $profileImgUrl\n\n'
        '\t\tresponse: $responseString\n'
        '\t\tuser json: $prettyUserJson\n\n'
        '}';
  }
}