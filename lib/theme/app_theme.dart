import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

const String fontFamily = 'Be Vietnam Pro';

class AppTheme {
  static const Color _primary = Color(0xFF516EB4);
  static const Color _secondary = Color(0xFFFFFFFF);
  static const Color _background = Color(0xFFFFFFFF);
  static const Color _onBackground = Color(0xFF383838);
  static const Color _onPrimary = Color(0xFFFFFFFF);
  static const Color _onSecondary = Color(0xFF383838);
  static const Color _secondaryContainer = Color(0xffEDF1F4);
  static const Color _onSecondaryContainer = Color(0xff383838);
  static const Color _surface = Color(0xFFD9D9D9);
  static const Color _onSurface = Color(0xFF383838);
  static const Color _error = Color(0xFFF67474);
  static const Color _onError = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: _background,
    switchTheme: _switchThemeData(),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.secondary,
    //   elevation: 0,
    //   unselectedLabelStyle: TextStyle(
    //     fontSize: 14,
    //     fontWeight: FontWeight.w500,
    //     color: _onSecondary,
    //   ),
    //   selectedLabelStyle: TextStyle(
    //     fontSize: 14,
    //     fontWeight: FontWeight.w500,
    //     color: _onSecondary,
    //   ),
    // ),
    appBarTheme: _appBarTheme(),
    radioTheme: _radioThemeData(),
    checkboxTheme: _checkBoxThemeData(),
    inputDecorationTheme: _inputDecorationTheme(),
    dialogTheme: _dialogThemeData(),
    colorScheme: _colorScheme(),
    listTileTheme: _listTileThemeData(),
    elevatedButtonTheme: _elevatedButtonThemeData(),
    textTheme: _textTheme(),
  );

  static ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: _primary,
        disabledBackgroundColor: _primary.withOpacity(0.2),
        disabledForegroundColor: _primary,
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
        ),
        textStyle: _textTheme().bodyMedium,
        padding: Sizes.mediumPadding,
      ),
    );
  }

  static ListTileThemeData _listTileThemeData() {
    return ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
      ),
      selectedColor: _primary,
      selectedTileColor: _primary.withOpacity(0.1),
      tileColor: AppColors.secondary,
    );
  }

  static RadioThemeData _radioThemeData() {
    return RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => _primary),
    );
  }

  static SwitchThemeData _switchThemeData() {
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.all(_primary),
      trackColor: MaterialStateProperty.all(_background),
      overlayColor: MaterialStateProperty.all(_primary),
    );
  }

  static CheckboxThemeData _checkBoxThemeData() {
    return CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      fillColor: MaterialStateColor.resolveWith((states) => _primary),
    );
  }

  static DialogTheme _dialogThemeData() {
    return DialogTheme(
      backgroundColor: _background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: _secondary,
      hintStyle: _textTheme().bodyMedium!.copyWith(
            color: _textTheme().bodyMedium!.color!.withOpacity(0.4),
          ),
      errorStyle: _textTheme().bodyMedium!.copyWith(
            color: _error,
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: _surface,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: _surface, width: 1.5),
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: _surface, width: 1.5),
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      labelStyle: _textTheme().bodyMedium,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.small),
        borderSide: const BorderSide(color: _error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Sizes.small),
        borderSide: const BorderSide(color: _error, width: 1.5),
      ),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      elevation: 2,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: _onSecondary,
      ),
      titleTextStyle: _textTheme().titleMedium,
      color: _background,
    );
  }

  static ColorScheme _colorScheme() {
    return const ColorScheme.light().copyWith(
      primary: _primary,
      onPrimary: _onPrimary,
      secondary: _secondary,
      onSecondary: _onSecondary,
      secondaryContainer: _secondaryContainer,
      onSecondaryContainer: _onSecondaryContainer,
      background: _background,
      onBackground: _onBackground,
      surface: _surface,
      onSurface: _onSurface,
      error: _error,
      onError: _onError,
    );
  }

  static TextTheme _textTheme() {
    return ThemeData.light().textTheme.copyWith(
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
  }

  static ThemeData darkTheme = ThemeData.dark();
}

extension ColorSchemeExtension on ColorScheme {
  static const Color _success = Color(0xFF68B92E);
  static const Color _OnSuccess = Color(0xFFFFFFFF);

  Color get success => _success;
  Color get onSuccess => _OnSuccess;
}
