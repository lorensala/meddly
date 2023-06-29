import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_has_all_consumed_provider.g.dart';

@riverpod
bool calendarHasAllConsumed(
  CalendarHasAllConsumedRef ref, {
  required DateTime date,
}) {
  return ref.watch(calendarControllerProvider).maybeWhen(
        orElse: () => false,
        data: (usersCalendarList) {
          for (final userCalendar in usersCalendarList) {
            for (final entry in userCalendar.entries) {
              final calendar = entry.value;

              if (calendar.consumptions.isEmpty) {
                return false;
              }

              for (final consumption in calendar.consumptions) {
                if (consumption.date.isSameDay(date) && !consumption.consumed) {
                  return false;
                }
              }
            }
          }
          return true;
        },
      );
}
