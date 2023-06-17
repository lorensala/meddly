import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

const String fontFamily = 'Montserrat';

class AppTheme {
  static const Color _primaryLight = Color(0xFF516EB4);
  static const Color _secondaryLight = Colors.white;
  static const Color _backgroundLight = Colors.white;
  static const Color _onBackgroundLight = Colors.black;
  static const Color _onPrimaryLight = Color(0xFFFFFFFF);
  static const Color _onSecondaryLight = Color(0xFF000000);
  static const Color _secondaryContainerLight = Color(0xffEDF1F4);
  static const Color _onSecondaryContainerLight = Color(0xff383838);
  static const Color _surfaceLight = Color(0xFFD9D9D9);
  static const Color _onSurfaceLight = Colors.black;
  static const Color _shadowLight = Color(0xFFEBEBEB);
  static const Color _errorLight = Color(0xFFF67474);
  static const Color _onErrorLight = Color(0xFFFFFFFF);

  static const Color _primaryDark = Color(0xFF516EB4);
  static const Color _secondaryDark = Color(0xFF1D1D1D);
  static const Color _backgroundDark = Color(0xFF000000);
  static const Color _onBackgroundDark = Colors.white;
  static const Color _onPrimaryDark = Color(0xFFFFFFFF);
  static const Color _onSecondaryDark = Color(0xFFFFFFFF);
  static const Color _secondaryContainerDark = Color(0xFF2B2B2B);
  static const Color _onSecondaryContainerDark = Color(0xFFFFFFFF);
  static const Color _surfaceDark = Color(0xFF171717);
  static const Color _onSurfaceDark = Colors.white;
  static const Color _shadowDark = Color(0xFF1C1C1C);
  static const Color _errorDark = Color(0xFFAD5B5B);
  static const Color _onErrorDark = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: _backgroundLight,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(_primaryLight),
      overlayColor: MaterialStateProperty.all(_primaryLight),
      trackColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? _primaryLight
            : _surfaceLight,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: _onSecondaryLight,
      ),
      titleTextStyle: _lightTextTheme()
          .titleLarge!
          .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
      color: _backgroundLight,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => _primaryLight),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      fillColor: MaterialStateColor.resolveWith((states) => _primaryLight),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _onSecondaryLight.withOpacity(0.05),
      hintStyle: _lightTextTheme().bodyMedium!.copyWith(
            color: _lightTextTheme().bodyMedium!.color!.withOpacity(0.4),
          ),
      errorStyle: _lightTextTheme().bodySmall!.copyWith(
            color: _errorLight,
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _surfaceLight,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(Sizes.extraSmall),
      ),
      floatingLabelStyle: _lightTextTheme().titleMedium,
      focusColor: _onPrimaryLight,
      labelStyle: _lightTextTheme().bodyMedium!.copyWith(
            color: _onBackgroundLight.withOpacity(0.5),
          ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.extraSmall),
        borderSide: const BorderSide(
          width: 2,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: _surfaceLight, width: 1.5),
        borderRadius: BorderRadius.circular(Sizes.extraSmall),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: _surfaceLight, width: 1.5),
        borderRadius: BorderRadius.circular(Sizes.extraSmall),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.extraSmall),
        borderSide: const BorderSide(color: _errorLight, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.extraSmall),
        borderSide: const BorderSide(color: _errorLight, width: 1.5),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: _primaryLight,
      onPrimary: _onPrimaryLight,
      secondary: _secondaryLight,
      onSecondary: _onSecondaryLight,
      secondaryContainer: _secondaryContainerLight,
      onSecondaryContainer: _onSecondaryContainerLight,
      background: _backgroundLight,
      onBackground: _onBackgroundLight,
      surface: _surfaceLight,
      onSurface: _onSurfaceLight,
      error: _errorLight,
      onError: _onErrorLight,
      shadow: _shadowLight,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: _lightTextTheme().titleSmall,
      unselectedLabelStyle: _lightTextTheme().titleSmall!.copyWith(
            fontWeight: FontWeight.w400,
          ),
      labelColor: _onBackgroundLight,
      indicatorColor: _primaryLight,
    ),
    listTileTheme: ListTileThemeData(
      selectedColor: _primaryLight,
      titleTextStyle: _lightTextTheme().titleMedium!.copyWith(
            color: _onSecondaryLight,
          ),
      subtitleTextStyle: _lightTextTheme().bodyMedium!.copyWith(
            color: _onSecondaryLight.withOpacity(0.5),
          ),
      selectedTileColor: _primaryLight.withOpacity(0.1),
      tileColor: _backgroundLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: _primaryLight,
        shadowColor: _onSecondaryLight.withOpacity(0.2),
        disabledBackgroundColor: _primaryLight.withOpacity(0.2),
        disabledForegroundColor: _primaryLight,
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.small),
        ),
        textStyle: _lightTextTheme().bodyMedium,
        padding: const EdgeInsets.all(Sizes.medium),
      ),
    ),
    textTheme: _lightTextTheme(),
    chipTheme: ChipThemeData(
      labelStyle: _lightTextTheme().bodyMedium!.copyWith(color: _primaryLight),
      secondaryLabelStyle: _lightTextTheme()
          .bodyMedium!
          .copyWith(color: _onSecondaryLight.withOpacity(0.5)),
      selectedColor: _primaryLight.withOpacity(0.25),
      backgroundColor: _secondaryLight,
    ),
  );

  static TextTheme _lightTextTheme() {
    return ThemeData.light().textTheme.copyWith(
          displayLarge: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 57,
            color: _onSecondaryLight,
          ),
          displayMedium: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 45,
            color: _onSecondaryLight,
          ),
          displaySmall: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: _onSecondaryLight,
          ),
          headlineLarge: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 32,
            color: _onSecondaryLight,
          ),
          headlineMedium: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 28,
            color: _onSecondaryLight,
          ),
          headlineSmall: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: _onSecondaryLight,
          ),
          titleLarge: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: _onSecondaryLight,
          ),
          titleMedium: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: _onSecondaryLight,
          ),
          titleSmall: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: _onSecondaryLight,
          ),
          labelLarge: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: _onSecondaryLight,
          ),
          labelMedium: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: _onSecondaryLight,
          ),
          labelSmall: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 11,
            color: _onSecondaryLight,
          ),
          bodyLarge: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: _onSecondaryLight,
          ),
          bodyMedium: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: _onSecondaryLight,
          ),
          bodySmall: const TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: _onSecondaryLight,
          ),
        );
  }

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: _backgroundDark,
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(_primaryDark),
      overlayColor: MaterialStateProperty.all(_primaryDark),
      trackColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? _primaryDark
            : _surfaceDark,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: _onSecondaryDark,
      ),
      titleTextStyle: _darkTextTheme()
          .titleLarge!
          .copyWith(fontWeight: FontWeight.w500, fontSize: 18),
      color: _backgroundDark,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => _primaryDark),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      fillColor: MaterialStateColor.resolveWith((states) => _primaryDark),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _secondaryDark,
      hintStyle: _darkTextTheme().bodyMedium!.copyWith(
            color: _darkTextTheme().bodyMedium!.color!.withOpacity(0.4),
          ),
      errorStyle: _darkTextTheme().bodySmall!.copyWith(
            color: _errorDark,
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _surfaceDark,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: _surfaceDark, width: 1.5),
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: _surfaceDark, width: 1.5),
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      labelStyle: _darkTextTheme().bodyMedium,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.small),
        borderSide: const BorderSide(color: _errorDark, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.small),
        borderSide: const BorderSide(color: _errorDark, width: 1.5),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _backgroundDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _primaryDark,
      onPrimary: _onPrimaryDark,
      secondary: _secondaryDark,
      onSecondary: _onSecondaryDark,
      secondaryContainer: _secondaryContainerDark,
      onSecondaryContainer: _onSecondaryContainerDark,
      background: _backgroundDark,
      onBackground: _onBackgroundDark,
      surface: _surfaceDark,
      onSurface: _onSurfaceDark,
      error: _errorDark,
      onError: _onErrorDark,
      shadow: _shadowDark,
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      selectedColor: _primaryDark,
      selectedTileColor: _primaryDark.withOpacity(0.1),
      tileColor: _backgroundDark,
    ),
    dividerTheme: const DividerThemeData(
      color: _surfaceDark,
      thickness: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: _primaryDark,
        disabledBackgroundColor: _primaryDark.withOpacity(0.2),
        disabledForegroundColor: _primaryDark,
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.small),
        ),
        textStyle: _darkTextTheme().bodyMedium,
        padding: const EdgeInsets.all(Sizes.medium),
      ),
    ),
    textTheme: _darkTextTheme(),
    chipTheme: ChipThemeData(
      labelStyle: _darkTextTheme().bodyMedium!.copyWith(color: _primaryDark),
      secondaryLabelStyle: _darkTextTheme()
          .bodyMedium!
          .copyWith(color: _onSecondaryDark.withOpacity(0.5)),
      selectedColor: _primaryDark.withOpacity(0.25),
      backgroundColor: _secondaryDark,
    ),
  );

  static TextTheme _darkTextTheme() {
    return ThemeData.dark().textTheme.copyWith(
          displayLarge: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          displayMedium: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          displaySmall: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          headlineLarge: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          headlineMedium: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          headlineSmall: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          titleLarge: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          titleMedium: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          titleSmall: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          labelLarge: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          labelMedium: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          labelSmall: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          bodyLarge: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          bodyMedium: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
          bodySmall: const TextStyle(
            fontFamily: fontFamily,
            color: _onSecondaryDark,
          ),
        );
  }
}

extension ColorSchemeExtension on ColorScheme {
  static const Color _success = Color.fromARGB(255, 46, 185, 99);
  static const Color _onSuccess = Color(0xFFFFFFFF);

  Color get success => _success;
  Color get onSuccess => _onSuccess;
}
