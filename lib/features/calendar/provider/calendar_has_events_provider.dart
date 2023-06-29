import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_has_events_provider.g.dart';

@riverpod
bool calendarHasEvents(CalendarHasEventsRef ref, {required DateTime date}) {
  return ref.watch(calendarControllerProvider).maybeWhen(
        orElse: () => false,
        data: (usersCalendarList) {
          for (final userCalendar in usersCalendarList) {
            for (final entry in userCalendar.entries) {
              final calendar = entry.value;

              for (final appointment in calendar.appointments) {
                if (appointment.date.isSameDay(date)) {
                  return true;
                }
              }

              for (final measurement in calendar.measurements) {
                if (measurement.date.isSameDay(date)) {
                  return true;
                }
              }

              for (final consumption in calendar.consumptions) {
                if (consumption.date.isSameDay(date)) {
                  return true;
                }
              }
            }
          }
          return false;
        },
      );
}
