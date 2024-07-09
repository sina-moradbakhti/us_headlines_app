import 'package:flutter/material.dart';

class AppColors {
  static Color get primaryColor => const Color(0xff4A90E2);
  static Color get secondaryColor => const Color(0xffFE763A);
  static Color get scaffoldBgColor => const Color(0xffffffff);
  static Color get darkTextColor => const Color(0xff000000);
  static Color get lightTextColor => const Color(0xffffffff);
  static Color get textfieldHintColor =>
      const Color(0xff000000).withOpacity(0.5);
  static Color get textfieldBgColor => const Color.fromARGB(255, 246, 246, 246);
  static Color get lightGreyColor => const Color.fromARGB(255, 181, 181, 181);

  static Color get primaryButtonTextColor => const Color(0xffffffff);
}

class AppShadows {
  static BoxShadow get lightShadow => BoxShadow(
        blurRadius: 10,
        color: Colors.black.withAlpha(10),
        offset: const Offset(0, 2.3),
        spreadRadius: 0.3,
      );
}
