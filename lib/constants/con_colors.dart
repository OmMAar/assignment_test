import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const primaryColor = Color(0xff174674);

  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;
  static const Color mainColor = Color(0xff174674);
  static const Color blueBackground = Color(0xff4285F4);
  static const Color mainGray = Color(0xff707070);
  static const Color lightGrey = Color(0xffE3E3E3);
  static const Color whitePureColor = Color(0xFFffffff);

  static const Map<int, Color> blue = <int, Color>{
    50: Color(0xFFE1F5FE),
    100: Color(0xFFB3E5FC),
    200: Color(0xFF81D4FA),
    300: Color(0xFF4FC3F7),
    400: Color(0xFF29B6F6),
    500: Color(0xFF03A9F4),
    600: Color(0xFF039BE5),
    700: Color(0xFF0288D1),
    800: Color(0xFF0277BD),
    900: Color(0xFF01579B)
  };

  static const Map<int, Color> grey = <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFEEEEEE),
    300: Color(0xFFE0E0E0),
    400: Color(0xFFBDBDBD),
    500: Color(0xFF9E9E9E),
    600: Color(0xFF757575),
    700: Color(0xFF616161),
    800: Color(0xFF424242),
    900: Color(0xFF212121)
  };

  static const Color darkGreen = Color(0xff008584);
  static const Color scaffoldBGColor = Color(0xffF0f0f0);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
