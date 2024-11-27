import 'package:flutter/material.dart';
import 'package:cpdsite/configs/configs.dart';

class App {
  static init(BuildContext context) {
    UI.init(context);
    AppDimensions.init();
    Space.init();
    AppText.init();
  }
}
