import 'package:flutter/material.dart';

class PColor {
  static Color get primaryPink => const Color(0xfffb6f92);
  static Color get primaryLightPink => Color.fromRGBO(255, 143, 171, 1);
  static Color get text => const Color(0xff212121);
  static Color get textBox =>
      Color.fromARGB(255, 183, 172, 172).withOpacity(0.2);
  static Color get subtitle => const Color(0xff212121).withOpacity(0.4);
  static List<Color> get button => const [Color(0xfffb6f92), Color(0xffff5d8f)];
  static Color get backG => const Color(0xfffff0f3);

  static List<Color> get searchBGColor => const [
        Color(0xffB7143C),
        Color(0xffE6A500),
        Color.fromARGB(255, 215, 64, 64),
        Color.fromARGB(255, 199, 80, 159),
        Color(0xff09ADE2),
        Color(0xffD36A43),
      ];
}
