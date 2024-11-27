import 'dart:math';
import 'package:flutter/widgets.dart';

class UI {
  static MediaQueryData? _mediaQueryData;
  static double? width;
  static double? height;
  static double? horizontal;
  static double? vertical;
  static EdgeInsets? padding;

  static bool? w300;
  static bool? w360;
  static bool? w480;
  static bool? w600;
  static bool? w720;
  static bool? w980;
  static bool? w1160;
  static bool? w1400;
  static bool? w1700;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    initChecks(_mediaQueryData!);

    padding = _mediaQueryData!.padding;
    width = _mediaQueryData!.size.width;
    height = _mediaQueryData!.size.height;
    horizontal = width! / 100;
    vertical = height! / 100;
  }

  static initChecks(MediaQueryData query) {
    var size = query.size;
    w300 = size.width > 300;
    w360 = size.width > 360;
    w480 = size.width > 480;
    w600 = size.width > 600;
    w720 = size.width > 720;
    w980 = size.width > 980;
    w1160 = size.width > 1160;
    w1400 = size.width > 1400;
    w1700 = size.width > 1700;
  }

  static MediaQueryData mediaQuery() => _mediaQueryData!;

}
