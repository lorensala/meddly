import 'package:calendar/calendar.dart';
import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_api_provider.g.dart';

@riverpod
CalendarApi calendarApi(CalendarApiRef ref) {
  return CalendarApi(ref.read(dioProvider));
}
