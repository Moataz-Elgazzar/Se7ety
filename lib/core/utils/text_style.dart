import 'package:flutter/widgets.dart';

class TextStyles {
  static TextStyle boldStyle({Color? color, double fontSize = 20}) {
    return TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
  }

  static TextStyle semiBoldStyle({Color? color, double fontSize = 20}) {
    return TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w600);
  }

  static TextStyle mediumStyle({Color? color, double fontSize = 20}) {
    return TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w500);
  }

  static TextStyle regularStyle({Color? color, double fontSize = 20}) {
    return TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.w400);
  }
}
