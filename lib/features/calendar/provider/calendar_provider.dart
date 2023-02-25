import 'package:calendar/calendar.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_provider.g.dart';

@riverpod
CalendarCache calendarCache(CalendarCacheRef ref) {
  return CalendarCache(box: ref.read(calendarBoxProvider));
}

@riverpod
CalendarApi calendarApi(CalendarApiRef ref) {
  return CalendarApi(ref.read(dioProvider));
}

@riverpod
CalendarRepository calendarRepository(CalendarRepositoryRef ref) {
  return CalendarRepository(
      cache: ref.read(calendarCacheProvider),
      api: ref.read(calendarApiProvider));
}

final calendarStreamProvider =
    StreamProvider<Either<CalendarFailure, List<Event>>>((ref) {
  final repository = ref.read(calendarRepositoryProvider);
  return repository.events;
});

final medicinesStreamProvider =
    StreamProvider<Either<CalendarFailure, List<Medicine>>>((ref) {
  final repository = ref.read(calendarRepositoryProvider);
  return repository.medicines;
});

@riverpod
List<Event> calendarEvents(CalendarEventsRef ref) {
  return ref.watch(calendarStreamProvider).maybeWhen(
        data: (events) => events.fold(
          (l) => [],
          (events) => events,
        ),
        orElse: () => [],
      );
}

final selectedDateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

@riverpod
bool hasConsumedConsumption(HasConsumedConsumptionRef ref,
    {required DateTime date}) {
  final events = ref.watch(calendarEventsProvider);

  return events.any(
    (event) => event.maybeMap(
      fromConsumption: (consumption) =>
          consumption.date.isSameDay(date) && consumption.consumed,
      orElse: () => false,
    ),
  );
}

@riverpod
List<DateTime> allDaysOfYear(AllDaysOfYearRef ref) {
  return getAllDaysInYear();
}

@riverpod
List<Event> calendarTodayEvents(CalendarTodayEventsRef ref) {
  final now = DateTime.now();
  return ref.watch(calendarStreamProvider).when(
      data: (res) {
        return res.fold(
          (l) => [],
          (events) {
            return events.where((event) {
              return event.maybeMap(
                fromConsumption: (consumption) =>
                    consumption.date.isSameDay(now),
                orElse: () => false,
              );
            }).toList();
          },
        );
      },
      error: (_, __) => [],
      loading: () => []);
}

@riverpod
Event event(EventRef ref) {
  throw UnimplementedError();
}
