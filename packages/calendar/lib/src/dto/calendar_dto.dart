import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/dto/dto.dart';
import 'package:calendar/src/models/models.dart';
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
    @HiveField(0) @Default([]) List<MedicineDto> activeMedicines,
    @HiveField(1) @Default([]) List<AppointmentDto> appointments,
    @HiveField(2) @Default([]) List<MeasurementDto> measurements,
    @HiveField(3) @Default([]) List<ConsumptionDto> consumptions,
  }) = _CalendarDto;

  const CalendarDto._();

  /// Creates a [CalendarDto] from a JSON object.
  factory CalendarDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarDtoFromJson(json);

  /// Creates a [Calendar] from this [CalendarDto].
  ///
  /// Throws a [CalendarDtoException] if the [CalendarDto] can't be converted to
  /// a [Calendar].
  Calendar toDomain() {
    try {
      return Calendar(
        activeMedicines: activeMedicines.map((e) => e.toDomain()).toList(),
        appointments: appointments.map((e) => e.toDomain()).toList(),
        measurements: measurements.map((e) => e.toDomain()).toList(),
        consumptions: consumptions.map((e) => e.toDomain()).toList(),
      );
    } catch (e) {
      throw CalendarDtoException();
    }
  }
}
