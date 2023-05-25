import 'package:appointment/src/core/core.dart';
import 'package:appointment/src/models/models.dart';
import 'package:calendar/calendar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_dto.freezed.dart';
part 'appointment_dto.g.dart';

/// {@template appointment_dto}
/// Data transfer object for an appointment.
/// {@endtemplate}
@freezed
class AppointmentDto with _$AppointmentDto {
  /// {@macro appointment_dto}
  const factory AppointmentDto({
    required String date,
    required String name,
    String? doctor,
    String? speciality,
    String? location,
    String? notes,
    required int id,
  }) = _AppointmentDto;

  /// Converts a [Appointment] to a [AppointmentDto].
  factory AppointmentDto.fromDomain(Appointment appointment) {
    try {
      return AppointmentDto(
        date: appointment.date.toIso8601String(),
        name: appointment.name,
        doctor: appointment.doctor,
        speciality: appointment.speciality?.name,
        location: appointment.location,
        notes: appointment.notes,
        id: appointment.id,
      );
    } catch (e) {
      throw AppointmentDtoException();
    }
  }

  /// Creates a [AppointmentDto] from a JSON object.
  factory AppointmentDto.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDtoFromJson(json);

  const AppointmentDto._();

  /// Converts a [AppointmentDto] to a [Appointment].
  Appointment toDomain() {
    try {
      return Appointment(
        date: DateTime.parse(date),
        name: name,
        doctor: doctor,
        speciality: speciality != null
            ? AppointmentSpeciality.fromString(speciality!)
            : null,
        location: location,
        notes: notes,
        id: id,
      );
    } catch (e) {
      throw AppointmentDtoException();
    }
  }

  /// Converts a [AppointmentDto] to a [CalendarEvent].
  CalendarEvent toEvent() {
    try {
      return CalendarEvent.fromAppointment(
        id: id,
        date: DateTime.parse(date),
        title: name,
        description: doctor.toString(),
      );
    } catch (e) {
      throw AppointmentDtoException();
    }
  }
}
