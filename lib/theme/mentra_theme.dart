import 'package:flutter/material.dart';

class MentraColors {
  static const Color background = Color(0xFFF7F8F8);

  static const Color primaryMint = Color(0xFF7BAF9E);
  static const Color mintSoft = Color(0xFFDCEEE7);

  static const Color textDark = Color(0xFF2E3A36);
  static const Color textLight = Color(0xFF6B7A75);

  static const Color cardWhite = Colors.white;
}

class MentraTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: MentraColors.background,
    fontFamily: "Roboto",

    appBarTheme: const AppBarTheme(
      backgroundColor: MentraColors.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: MentraColors.textDark),
      titleTextStyle: TextStyle(
        color: MentraColors.textDark,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MentraColors.primaryMint,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: MentraColors.cardWhite,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
  );
}
