import 'package:cpd_project_store/data/auth/yandex_auth.dart';
import 'package:flutter/material.dart';

import '../../data/auth/auth_data.dart';
import '../../values/values.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key, required this.thirdParty});

  final String thirdParty;


  @override
  Widget build(BuildContext context) {
    Future<bool> authenticate = _getThirdPartyAuth(context);

    return Container();
  }

  Future<bool> _getThirdPartyAuth(context) {
    done(AuthData authData) {
      Navigator.pushReplacementNamed(context, '/complete-profile',
          arguments: authData);
    }

    var Auth = YandexAuth();

    return Auth.visa!.authenticate(
        clientID: AuthConst.CLIENT_ID,
        onDone: done);
  }
}
