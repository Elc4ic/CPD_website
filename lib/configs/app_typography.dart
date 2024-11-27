import 'package:flutter/material.dart';
import 'package:cpdsite/configs/configs.dart';

class AppText {
  static TextStyle? btn;

  // Headings
  static TextStyle? h1;
  static TextStyle? h1w;
  static TextStyle? h1b;
  static TextStyle? h1bw;
  static TextStyle? h2;
  static TextStyle? h2w;
  static TextStyle? h2b;
  static TextStyle? h2bw;
  static TextStyle? h3;
  static TextStyle? h3b;

  // Body
  static TextStyle? b1;
  static TextStyle? b1w;
  static TextStyle? b1b;
  static TextStyle? b2;
  static TextStyle? b2w;
  static TextStyle? b2b;
  static TextStyle? b2bw;
  static TextStyle? b3;
  static TextStyle? b3w;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l2;
  static TextStyle? l2b;

  static init() {
    const b = FontWeight.bold;
    const baseStyle = TextStyle(fontFamily: fontFamily);

    h1 = baseStyle.copyWith(fontSize: AppDimensions.font(20));
    h1w = h1!.copyWith(fontWeight: b,color: Colors.white);
    h1b = h1!.copyWith(fontWeight: b);
    h1bw = h1!.copyWith(fontWeight: b, color: Colors.white);

    h2 = baseStyle.copyWith(fontSize: AppDimensions.font(16));
    h2b = h2!.copyWith(fontWeight: b);
    h2bw = h2!.copyWith(fontWeight: b, color: Colors.white);
    h2w = h2!.copyWith(fontWeight: b,color: Colors.white);

    h3 = baseStyle.copyWith(fontSize: AppDimensions.font(12));
    h3b = h3!.copyWith(fontWeight: b);

    b1 = baseStyle.copyWith(fontSize: AppDimensions.font(10));
    b1w = b1!.copyWith(color: Colors.white);
    b1b = b1!.copyWith(fontWeight: b);

    b2 = baseStyle.copyWith(fontSize: AppDimensions.font(8));
    b2w = b2!.copyWith(fontWeight: b, color: Colors.white);
    b2b = b2!.copyWith(fontWeight: b);
    b2bw = b2!.copyWith(fontWeight: b, color: Colors.white);

    l1 = baseStyle.copyWith(fontSize: AppDimensions.font(6));
    l1b = l1!.copyWith(fontWeight: b);

    l2 = baseStyle.copyWith(fontSize: AppDimensions.font(4));
    l2b = l2!.copyWith(fontWeight: b);
  }
}
