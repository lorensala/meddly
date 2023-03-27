import 'package:calendar/src/dto/dto.dart';

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
