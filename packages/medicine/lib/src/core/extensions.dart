import 'package:flutter/material.dart';

/// {@template medicine_dto_exception}
/// Extension for [TimeOfDay].
/// {@endtemplate}
extension TimeOfDayX on TimeOfDay {
  /// Converts a [TimeOfDay] to a [String] in the format `HH:mm`.
  String toHHmm() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}
