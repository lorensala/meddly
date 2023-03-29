import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_selected_date_provider.g.dart';

@riverpod
class CalendarSelectedDate extends _$CalendarSelectedDate {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void update(DateTime date) {
    state = date;
  }
}
