import 'package:calendar/src/dto/dto.dart';
import 'package:flutter/material.dart' show TimeOfDay;

/// {@template consumption_dto_exception}
/// Extension for [ConsumptionDto].
/// {@endtemplate}
extension ConsumptionX on ConsumptionDto {
  /// Checks if two [ConsumptionDto] have equal `medicineId` and `date` values.
  bool isEqual(ConsumptionDto consumptionDto) {
    return (medicineId == consumptionDto.medicineId) &&
        (DateTime.parse(date) == DateTime.parse(consumptionDto.date));
  }
}

/// {@template medicine_dto_exception}
/// Extension for [TimeOfDay].
/// {@endtemplate}
extension TimeOfDayX on TimeOfDay {
  /// Converts a [TimeOfDay] to a [String] in the format `HH:mm`.
  String toHHmm() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}
