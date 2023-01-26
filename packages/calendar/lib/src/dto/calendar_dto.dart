import 'package:calendar/src/dto/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'calendar_dto.freezed.dart';
part 'calendar_dto.g.dart';

/// {@template calendar_dto}
/// Data transfer object for a calendar.
/// {@endtemplate}
@freezed
@HiveType(typeId: 3)
class CalendarDto with _$CalendarDto {
  /// {@macro calendar_dto}
  const factory CalendarDto({
    @HiveField(0) required List<MedicineDto> activeMedicines,
    @HiveField(1) required List<AppointmentDto> appointments,
    @HiveField(2) required List<MeasurementDto> measurements,
  }) = _CalendarDto;

  const CalendarDto._();

  /// Creates a [CalendarDto] from a JSON object.
  factory CalendarDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarDtoFromJson(json);
}
