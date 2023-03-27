import 'package:appointment/appointment.dart';
import 'package:calendar/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:measurement/measurement.dart';
import 'package:medicine/medicine.dart';

part 'calendar.freezed.dart';

/// {@template calendar}
/// A calendar.
/// {@endtemplate}
@freezed
class Calendar with _$Calendar {
  /// {@macro calendar}
  const factory Calendar({
    required List<Medicine> activeMedicines,
    required List<Appointment> appointments,
    required List<Measurement> measurements,
    required List<Consumption> consumptions,
  }) = _Calendar;
  const Calendar._();
}
