part of 'calendar_bloc.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState.initial() = _Initial;
  const factory CalendarState.loading() = _Loading;
  const factory CalendarState.success({
    required List<Event> events,
  }) = _Success;
  const factory CalendarState.failure({
    required CalendarFailure failure,
  }) = _Failure;

  const CalendarState._();

  bool hasConsumedConsumption(DateTime date) {
    return maybeWhen(
      orElse: () => false,
      success: (events) {
        return events.any(
          (event) => event.maybeMap(
            fromConsumption: (consumption) =>
                consumption.date.day == date.day &&
                consumption.date.month == date.month &&
                consumption.date.year == date.year &&
                consumption.consumed,
            orElse: () => false,
          ),
        );
      },
    );
  }
}
