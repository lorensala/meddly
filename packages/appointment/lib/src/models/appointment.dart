import 'package:appointment/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

@freezed
class Appointment with _$Appointment {
  const factory Appointment({
    required DateTime date,
    required String name,
    int? id,
    String? doctor,
    AppointmentSpeciality? speciality,
    String? location,
    String? notes,
  }) = _Appointment;

  const Appointment._();

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  bool get isUpcoming {
    return date.isAfter(DateTime.now());
  }
}
