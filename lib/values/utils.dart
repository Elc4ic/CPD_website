part of 'values.dart';

class Utils {
  static double widthNow(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Widget devideWidth30(double wigth) {
    return SizedBox(width: wigth / 30);
  }

  static Widget devideWidth15(double wigth) {
    return SizedBox(width: wigth / 15);
  }

  static Widget devideWidth60(double wigth) {
    return SizedBox(width: wigth / 60);
  }

  static Widget devideHeight30(double h) {
    return SizedBox(height: h / 30);
  }

  static Widget devideHeight15(double h) {
    return SizedBox(height: h / 15);
  }

  static Widget devideHeight60(double h) {
    return SizedBox(height: h / 60);
  }
  static Widget devideHeight120(double h) {
    return SizedBox(height: h / 120);
  }
}
