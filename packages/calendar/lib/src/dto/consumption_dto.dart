import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'consumption_dto.freezed.dart';
part 'consumption_dto.g.dart';

/// {@template consumption_dto}
/// Data transfer object for a consumption.
/// {@endtemplate}
@freezed
@HiveType(typeId: 7)
class ConsumptionDto with _$ConsumptionDto {
  /// {@macro consumption_dto}
  const factory ConsumptionDto({
    @HiveField(0) required String date,
    @HiveField(1) required String realConsumptionDate,
    @HiveField(2) required int medicineId,
    @HiveField(3) required bool consumed,
    @HiveField(4) required int id,
  }) = _ConsumptionDto;

  /// Creates a [ConsumptionDto] from a [Consumption].
  factory ConsumptionDto.fromDomain(Consumption consumption) {
    try {
      return ConsumptionDto(
        date: consumption.date.toIso8601String(),
        realConsumptionDate: consumption.realConsumptionDate.toIso8601String(),
        medicineId: consumption.medicineId,
        consumed: consumption.consumed,
        id: consumption.id,
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
        id: id,
      );
    } catch (e) {
      throw ConsumptionDtoException();
    }
  }
}
