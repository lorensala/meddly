import 'package:calendar/calendar.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/controller/calendar_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_today_events_provider.g.dart';

@riverpod
List<CalendarEvent> calendarTodayEvents(CalendarTodayEventsRef ref) {
  final now = DateTime.now();

  return ref.watch(calendarControllerProvider).maybeWhen(
      data: (res) {
        return res.fold(
            (l) => [],
            (r) => r.where((e) {
                  return e.date.isSameDay(now);
                }).toList());
      },
      orElse: () => []);
}
