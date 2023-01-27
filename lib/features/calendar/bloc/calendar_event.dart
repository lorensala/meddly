part of 'calendar_bloc.dart';

/// {@template calendar_event}
/// Sealed class for all events that can be added by the [CalendarBloc].
/// {@endtemplate}
@freezed
class CalendarEvent with _$CalendarEvent {
  /// {@macro calendar_event}
  ///
  /// Watches the calendar cache stream for changes.
  const factory CalendarEvent.watch() = _Watch;

  /// {@macro calendar_event}
  ///
  /// Adds a [Consumption] to the calendar cache.
  const factory CalendarEvent.addConsumption({
    required Consumption consumption,
  }) = _AddConsumption;

  /// {@macro calendar_event}
  ///
  /// Updates a [Consumption] in the calendar cache.
  const factory CalendarEvent.deleteConsumption({
    required Consumption consumption,
  }) = _DeleteConsumption;

  /// {@macro calendar_event}
  ///
  /// Fetches the calendar from the [CalendarApi].
  const factory CalendarEvent.fetchAll() = _FetchAll;
}
