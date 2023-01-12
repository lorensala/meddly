import 'package:flutter/material.dart';

String font = 'Be Vietnam Pro';

class ThemeManager {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: scaffoldBackgroundColorLight,
    bottomAppBarColor: secondaryLight,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(primaryLight),
      trackColor: MaterialStateProperty.all(scaffoldBackgroundColorLight),
      overlayColor: MaterialStateProperty.all(primaryLight),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: secondaryLight,
      elevation: 0,
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      selectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: textTheme.titleMedium,
      color: scaffoldBackgroundColorLight,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => primaryLight),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      fillColor: MaterialStateColor.resolveWith((states) => primaryLight),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: scaffoldBackgroundColorLight,
      hintStyle: textTheme.bodyMedium!.copyWith(
        color: textTheme.bodyMedium!.color!.withOpacity(0.4),
      ),
      errorStyle: textTheme.bodyMedium!.copyWith(
        color: errorLight,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scaffoldBackgroundColorLight),
        borderRadius: BorderRadius.circular(20),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: scaffoldBackgroundColorLight),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: scaffoldBackgroundColorLight),
        borderRadius: BorderRadius.circular(20),
      ),
      labelStyle: textTheme.bodyMedium,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: errorLight),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: errorLight),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: scaffoldBackgroundColorLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryLight,
      background: scaffoldBackgroundColorLight,
      secondary: secondaryLight,
      error: errorLight,
      secondaryContainer: Colors.black,
    ),
    textTheme: textTheme,
  );
  static ThemeData darkTheme = ThemeData.dark();
}

Color primaryLight = const Color(0xff516EB4);
Color secondaryLight = const Color(0xffFFFFFF);
Color scaffoldBackgroundColorLight = const Color(0xffF5F4F8);
Color errorLight = const Color(0xffFF5158);

extension ColorSchemeExtension on ColorScheme {
  Color get validColor => const Color(0xff3BBD9F);
}

TextTheme textTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 28,
    fontFamily: font,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 24,
    fontFamily: font,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    fontSize: 20,
    fontFamily: font,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
  labelMedium: TextStyle(fontSize: 16, fontFamily: font, color: Colors.white),
  bodySmall: TextStyle(fontSize: 14, fontFamily: font, color: Colors.black),
  bodyMedium: TextStyle(fontSize: 16, fontFamily: font, color: Colors.black),
  bodyLarge: TextStyle(fontSize: 18, fontFamily: font, color: Colors.black),
);
