import 'package:meddly/features/calendar/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_days_provider.g.dart';

@riverpod
List<DateTime> calendarDays(CalendarDaysRef ref) {
  return getAllDaysInYear();
}
