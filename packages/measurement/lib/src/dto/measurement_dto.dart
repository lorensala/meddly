import 'package:calendar/calendar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:measurement/src/core/core.dart';
import 'package:measurement/src/models/models.dart';

part 'measurement_dto.freezed.dart';
part 'measurement_dto.g.dart';

/// {@template measurement_dto}
/// Data transfer object for a measurement.
/// {@endtemplate}
@freezed
@HiveType(typeId: 5)
class MeasurementDto with _$MeasurementDto {
  /// {@macro measurement_dto}
  const factory MeasurementDto({
    @HiveField(0) required String date,
    @HiveField(1) required String type,
    @HiveField(2) required double value,
    @HiveField(3) required int id,
  }) = _MeasurementDto;

  /// Creates a [MeasurementDto] from a [Measurement].
  factory MeasurementDto.fromDomain(Measurement measurement) {
    return MeasurementDto(
      date: measurement.date.toIso8601String(),
      type: measurement.type,
      value: measurement.value,
      id: measurement.id,
    );
  }

  /// Creates a [MeasurementDto] from a JSON object.
  factory MeasurementDto.fromJson(Map<String, dynamic> json) =>
      _$MeasurementDtoFromJson(json);

  const MeasurementDto._();

  /// Creates a [MeasurementDto] from a [Measurement].
  factory MeasurementDto.fromMeasurement(Measurement measurement) {
    try {
      return MeasurementDto(
        date: measurement.date.toIso8601String(),
        type: measurement.type,
        value: measurement.value,
        id: measurement.id,
      );
    } catch (e) {
      throw MeasurementDtoException();
    }
  }

  /// Creates a [Measurement] from a [MeasurementDto].
  Measurement toDomain() {
    try {
      return Measurement(
        date: DateTime.parse(date),
        type: type,
        value: value,
        id: id,
      );
    } catch (e) {
      throw MeasurementDtoException();
    }
  }

  /// Creates an [CalendarEvent] from a [MeasurementDto].
  CalendarEvent toEvent() {
    try {
      return CalendarEvent.fromMeasurement(
        id: id,
        date: DateTime.parse(date),
        title: type,
        description: value.toString(),
      );
    } catch (e) {
      throw MeasurementDtoException();
    }
  }
}
