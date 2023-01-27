part of 'calendar_bloc.dart';

/// {@template calendar_state}
/// Sealed class for all states that can be emitted by the [CalendarBloc].
/// {@endtemplate}
@freezed
class CalendarState with _$CalendarState {
  /// {@macro calendar_state}
  ///
  /// Initial state of the [CalendarBloc].
  const factory CalendarState.initial() = _Initial;

  /// {@macro calendar_state}
  ///
  /// Loading state of the [CalendarBloc].
  const factory CalendarState.loading() = _Loading;

  /// {@macro calendar_state}
  ///
  /// Success state of the [CalendarBloc].
  /// Contains a [CalendarDto] from cache.
  const factory CalendarState.success({
    required Tuple4<List<Medicine>, List<Appointment>, List<Measurement>,
            List<Consumption>>
        events,
  }) = _Success;

  /// {@macro calendar_state}
  ///
  /// Failure state of the [CalendarBloc].
  /// Contains a [CalendarFailure] object.
  const factory CalendarState.failure({
    required CalendarFailure failure,
  }) = _Failure;

  const CalendarState._();
}
