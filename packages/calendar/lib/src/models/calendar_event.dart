import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_event.freezed.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.fromConsumption({
    required int id,
    @Default('') String title,
    @Default('') String description,
    required DateTime date,
    @Default(false) bool consumed,
  }) = _MedicineEvent;

  const factory CalendarEvent.fromAppointment({
    required int id,
    @Default('') String title,
    @Default('') String description,
    required DateTime date,
  }) = _AppointmentEvent;

  const factory CalendarEvent.fromMeasurement({
    required int id,
    @Default('') String title,
    @Default('') String description,
    required DateTime date,
    @Default(false) bool measured,
  }) = _MeasurementEvent;
}
