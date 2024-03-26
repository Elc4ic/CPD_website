import 'package:cpd_project_store/pages/details/project_details_page.dart';

import 'package:cpd_project_store/pages/login/auth_page.dart';
import 'package:cpd_project_store/pages/store/store_page.dart';
import 'package:cpd_project_store/pages/welcome/welcome.dart';
import 'package:cpd_project_store/theme.dart';
import 'package:cpd_project_store/values/values.dart';
import 'package:flutter/material.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Проектный центр',
      theme: mainTheme,
      initialRoute: StringConst.WELCOME_PAGE,
      routes: {
        StringConst.STORE_PAGE: (BuildContext context) =>
            const StorePage(),
        StringConst.WELCOME_PAGE: (BuildContext context) =>
            const WelcomePage(),
        StringConst.YANDEX_AUTH: (BuildContext context) =>
            AuthPage(thirdParty: 'yandex'),
      },
      onGenerateRoute: (routeSettings) {
        var path = routeSettings.name?.split('/');

        if (path?[1] == "project") {
          return MaterialPageRoute(
            builder: (context) => ProjectDetailPage(id: int.parse(path![2])),
            settings: routeSettings,
          );
        }

      },
    );
  }
}
