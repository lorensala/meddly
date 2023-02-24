import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

const String fontFamily = 'Be Vietnam Pro';

class ThemeManager {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.primary),
      trackColor: MaterialStateProperty.all(AppColors.scaffoldBackgroundColor),
      overlayColor: MaterialStateProperty.all(AppColors.primary),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      selectedLabelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: textTheme.titleMedium,
      color: AppColors.scaffoldBackgroundColor,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.secondary,
      hintStyle: textTheme.bodyMedium!.copyWith(
        color: textTheme.bodyMedium!.color!.withOpacity(0.4),
      ),
      errorStyle: textTheme.bodyMedium!.copyWith(
        color: AppColors.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.scaffoldBackgroundColor),
        borderRadius: BorderRadius.circular(20),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.scaffoldBackgroundColor),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.scaffoldBackgroundColor),
        borderRadius: BorderRadius.circular(20),
      ),
      labelStyle: textTheme.bodyMedium,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.error),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      secondary: AppColors.secondary,
      onSecondary: Colors.black,
      background: AppColors.scaffoldBackgroundColor,
      onBackground: Colors.black,
      onSurface: Colors.black,
      surface: Colors.black,
      error: AppColors.error,
      onError: Colors.white,
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
      ),
      selectedColor: AppColors.primary,
      selectedTileColor: AppColors.primary.withOpacity(0.1),
      tileColor: AppColors.secondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        disabledBackgroundColor: Colors.black,
        disabledForegroundColor: Colors.white,
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.borderRadius),
        ),
        textStyle: textTheme.bodyMedium,
        padding: Sizes.buttonPadding,
      ),
    ),
    textTheme: textTheme,
  );
  static ThemeData darkTheme = ThemeData.dark();
}

extension ColorSchemeExtension on ColorScheme {
  Color get success => const Color(0xff3BBD9F);
  Color get onSuccess => Colors.white;
}

final TextTheme textTheme = ThemeData.light().textTheme.copyWith(
      displayLarge: ThemeData.light()
          .textTheme
          .displayLarge!
          .copyWith(fontFamily: fontFamily),
      displayMedium: ThemeData.light().textTheme.displayMedium!.copyWith(
            fontFamily: fontFamily,
          ),
      displaySmall: ThemeData.light().textTheme.displaySmall!.copyWith(
            fontFamily: fontFamily,
          ),
      headlineLarge: ThemeData.light().textTheme.headlineLarge!.copyWith(
            fontFamily: fontFamily,
          ),
      headlineMedium: ThemeData.light().textTheme.headlineMedium!.copyWith(
            fontFamily: fontFamily,
          ),
      headlineSmall: ThemeData.light().textTheme.headlineSmall!.copyWith(
            fontFamily: fontFamily,
          ),
      titleLarge: ThemeData.light().textTheme.titleLarge!.copyWith(
            fontFamily: fontFamily,
          ),
      titleMedium: ThemeData.light().textTheme.titleMedium!.copyWith(
            fontFamily: fontFamily,
          ),
      titleSmall: ThemeData.light().textTheme.titleSmall!.copyWith(
            fontFamily: fontFamily,
          ),
      bodyLarge: ThemeData.light().textTheme.bodyLarge!.copyWith(
            fontFamily: fontFamily,
          ),
      bodyMedium: ThemeData.light().textTheme.bodyMedium!.copyWith(
            fontFamily: fontFamily,
          ),
    );
