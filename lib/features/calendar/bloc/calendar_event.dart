part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.watch() = _Watch;
  const factory CalendarEvent.addConsumption({
    required Consumption consumption,
  }) = _AddConsumption;
  const factory CalendarEvent.deleteConsumption({
    required Consumption consumption,
  }) = _DeleteConsumption;
  const factory CalendarEvent.fetchAll() = _FetchAll;
  const factory CalendarEvent.selectedDateChanged({
    required DateTime selectedDate,
  }) = _SelectedDateChanged;
}
