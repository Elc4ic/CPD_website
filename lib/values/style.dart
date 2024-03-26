part of 'values.dart';

class Styles {
  static TextStyle titleText24(BuildContext context) {
    return GoogleFonts.overpass(
      color: Color(0XFF192A3E),
      fontWeight: FontWeight.bold,
      fontSize: 24.0 + Utils.widthNow(context) / 200,
    );
  }

  static TextStyle titleWhiteText24(BuildContext context) {
    return GoogleFonts.sourceCodePro(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0 + Utils.widthNow(context) / 200,
    );
  }

  static TextStyle blueText18(BuildContext context) {
    return GoogleFonts.sourceCodePro(
      fontSize: 10.0 + Utils.widthNow(context) / 200,
      color: ColorConst.madison,
    );
  }

  static TextStyle whiteText18(BuildContext context) {
    return GoogleFonts.sourceCodePro(
      fontSize: 10.0 + Utils.widthNow(context) / 200,
      color: Colors.white,
    );
  }
  static TextStyle whiteText14(BuildContext context) {
    return GoogleFonts.sourceCodePro(
      fontSize: 9.0 + Utils.widthNow(context) / 300,
      color: Colors.white,
    );
  }


  static TextStyle text14(BuildContext context) {
    return GoogleFonts.sourceCodePro(
      fontSize: 10.0 + Utils.widthNow(context) / 300,
      letterSpacing: 1,
    );
  }
  static TextStyle titleText60(BuildContext context) {
    return GoogleFonts.overpass(
      fontWeight: FontWeight.bold,
      fontSize: 30.0 + Utils.widthNow(context) / 50,
    );
  }

  static TextStyle titleText46(BuildContext context) {
    return GoogleFonts.overpass(
      fontWeight: FontWeight.bold,
      fontSize: 38.0 + Utils.widthNow(context) / 200,
    );
  }
}

