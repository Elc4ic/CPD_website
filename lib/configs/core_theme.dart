import 'package:flutter/material.dart';

const fontFamily = 'Poppins';

final themeLight = ThemeData(
  primaryColorLight: const Color(0xff2b5ac0),
  brightness: Brightness.light,
  primaryColor: const Color(0xff2b5ac0),
  highlightColor: Colors.black,
  canvasColor: Colors.grey,
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.grey,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  )
      .copyWith(
        secondary: Colors.black,
        tertiary:  Color(0xff2b5ac0),
        brightness: Brightness.light,
        surface: Colors.black,
      )
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColorDark: const Color(0xff2b5ac0),
  primaryColor: const Color(0xff2b5ac0),
  highlightColor: const Color(0xff2b5ac0),
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  ).copyWith(
    surface: Colors.grey[800],
  ),
);
