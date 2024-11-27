import 'package:cpdsite/configs/core_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeMap = {
  "light": scheme(themeColors()),
  "dark": scheme(darkColors()),
};

final themeList = ["light", "dark"];

class AppProvider extends ChangeNotifier {
  static AppProvider state(BuildContext context, [bool listen = false]) =>
      Provider.of<AppProvider>(context, listen: listen);

  ColorScheme _scheme = themeMap[themeList[0]]!;
  late String theme = themeList[0];

  ColorScheme get scheme => _scheme;

  bool get isDark => theme == "dark";

  void init() async {
    final prefs = await SharedPreferences.getInstance();

    String? stringTheme = prefs.getString('theme');

    if (stringTheme != null) {
      theme = stringTheme;
      _scheme = themeMap[stringTheme]!;
    }
    notifyListeners();
  }

  void setTheme(String newTheme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (theme == newTheme) {
      return;
    }
    theme = newTheme;
    _scheme = themeMap[theme]!;

    await prefs.setString(
      'theme',
      theme,
    );

    notifyListeners();
  }
}
