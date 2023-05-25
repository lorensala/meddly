import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_event.freezed.dart';

/// {@template calendar_event}
/// A calendar event.
/// {@endtemplate}
@freezed
class CalendarEvent with _$CalendarEvent {
  /// {@macro calendar_event}
  const factory CalendarEvent.fromConsumption({
    required int id,
    @Default('') String title,
    @Default('') String description,
    required DateTime date,
    @Default(false) bool consumed,
  }) = _MedicineEvent;

  /// {@macro calendar_event}
  const factory CalendarEvent.fromAppointment({
    required int id,
    @Default('') String title,
    @Default('') String description,
    required DateTime date,
  }) = _AppointmentEvent;

  /// {@macro calendar_event}
  const factory CalendarEvent.fromMeasurement({
    required int id,
    @Default('') String title,
    @Default('') String description,
    required DateTime date,
    @Default(false) bool measured,
  }) = _MeasurementEvent;
}
