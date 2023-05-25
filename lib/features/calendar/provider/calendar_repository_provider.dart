import 'package:calendar/calendar.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_repository_provider.g.dart';

@riverpod
CalendarRepository calendarRepository(CalendarRepositoryRef ref) {
  return CalendarRepository(api: ref.read(calendarApiProvider));
}
