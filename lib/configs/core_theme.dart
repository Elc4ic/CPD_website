import 'package:flutter/material.dart';

const fontFamily = 'Poppins';

class themeColors {
  Brightness brightness = Brightness.light;
  Color main = const Color(0xffeeeef2);
  Color card = const Color(0xffffffff);
  Color primary = const Color(0xff0d4b75);
  Color tangaroa = Color(0xff00193c);
  Color text = const Color(0xff211f20);
  Color error = const Color(0xfff31d59);
}

class darkColors implements themeColors {
  @override
  Brightness brightness = Brightness.dark;
  @override
  Color main = const Color(0xff1F1F1F);
  @override
  Color card = const Color(0xff424040);
  @override
  Color primary = const Color(0xff5172ff);
  @override
  Color tangaroa = Color(0xff00193c);
  @override
  Color text = const Color(0xffF5E9DD);
  @override
  Color error = const Color(0xfff31d59);
}

ColorScheme scheme(themeColors colors) {
  return ColorScheme(
    brightness: colors.brightness,
    primary: colors.primary,
    onPrimary: colors.text,
    secondary: colors.card,
    onSecondary: colors.text,
    tertiary: colors.tangaroa,
    onTertiary: colors.text,
    error: colors.error,
    onError: colors.text,
    surface: colors.main,
    onSurface: colors.text,
  );
}

ThemeData AppTheme(ColorScheme colors) {
  return ThemeData(
    fontFamily: fontFamily,
    cardTheme: CardTheme(color: colors.secondary),
    colorScheme: colors,
    dividerTheme: DividerThemeData(
      color: colors.onSurface.withAlpha(50),
    ),
  );
}
