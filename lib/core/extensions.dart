import 'package:flutter/material.dart';

extension StringX on String {
  String get capitalizeFullName => split(' ').map((word) {
        return word.substring(0, 1).toUpperCase() +
            word.substring(1).toLowerCase();
      }).join(' ');

  String get dateTimeStringFormat =>
      '${substring(8, 10)}/${substring(5, 7)}/${substring(0, 4)}';
}

extension BuildContextX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
