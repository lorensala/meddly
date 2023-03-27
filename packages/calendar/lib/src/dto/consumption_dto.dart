import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medicine/medicine.dart';

part 'consumption_dto.freezed.dart';
part 'consumption_dto.g.dart';

/// {@template consumption_dto}
/// Data transfer object for a consumption.
/// {@endtemplate}
@freezed
class ConsumptionDto with _$ConsumptionDto {
  /// {@macro consumption_dto}
  const factory ConsumptionDto({
    required String date,
    required String realConsumptionDate,
    required int medicineId,
    required bool consumed,
  }) = _ConsumptionDto;

  /// Creates a [ConsumptionDto] from a [Consumption].
  factory ConsumptionDto.fromDomain(Consumption consumption) {
    try {
      return ConsumptionDto(
        date: consumption.date.toIso8601String(),
        realConsumptionDate: consumption.realConsumptionDate.toIso8601String(),
        medicineId: consumption.medicineId,
        consumed: consumption.consumed,
      );
    } catch (e) {
      throw ConsumptionDtoException();
    }
  }

  /// Creates a [ConsumptionDto] from a JSON object.
  factory ConsumptionDto.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionDtoFromJson(json);

  const ConsumptionDto._();

  /// Creates a [ConsumptionDto] from a [Consumption].
  Consumption toDomain() {
    try {
      return Consumption(
        date: DateTime.parse(date),
        realConsumptionDate: DateTime.parse(realConsumptionDate),
        medicineId: medicineId,
        consumed: consumed,
      );
    } catch (e) {
      throw ConsumptionDtoException();
    }
  }

  /// Creates a [Event] from a [ConsumptionDto].
  Event toEvent(Medicine medicineAssociatedWithConsumption) {
    try {
      return Event.fromConsumption(
        id: medicineId,
        date: DateTime.parse(date),
        title: medicineAssociatedWithConsumption.name,
        description: medicineAssociatedWithConsumption.presentation.name,
        consumed: consumed,
      );
    } catch (e) {
      throw ConsumptionDtoException();
    }
  }
}
