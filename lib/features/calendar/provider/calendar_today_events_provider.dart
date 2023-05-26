import 'package:calendar/calendar.dart';
import 'package:meddly/features/calendar/controller/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_today_events_provider.g.dart';

@riverpod
List<CalendarEvent> calendarTodayEvents(CalendarTodayEventsRef ref) {
  final now = DateTime.now();

  return ref.watch(calendarControllerProvider).maybeWhen(
        data: (res) {
          final events = <CalendarEvent>[];

          // for (final appointment in res.appointments) {
          //   if (appointment) {
          //     events.add(CalendarEvent.appointment(appointment));
          //   }
          // }

          // for (final consumption in res.consumptions) {
          //   if (consumption.date.isSameDay(now)) {
          //     events.add(CalendarEvent.consumption(consumption));
          //   }
          // }

          // for (final measurement in res.measurements) {
          //   if (measurement.date.isSameDay(now)) {
          //     events.add(CalendarEvent.measurement(measurement));
          //   }
          // }

          return events;
        },
        orElse: () => [],
      );
}
