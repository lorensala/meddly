import 'package:appointment/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment.freezed.dart';

/// {@template appointment}
/// An appointment.
/// {@endtemplate}
@freezed
class Appointment with _$Appointment {
  /// {@macro appointment}
  const factory Appointment({
    required DateTime date,
    required String name,
    String? doctor,
    AppointmentSpeciality? speciality,
    String? location,
    String? notes,
    required int id,
  }) = _Appointment;
  const Appointment._();
}
