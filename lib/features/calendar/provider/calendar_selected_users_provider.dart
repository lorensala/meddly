import 'package:meddly/features/calendar/calendar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'calendar_selected_users_provider.g.dart';

@riverpod
class CalendarSelectedUsers extends _$CalendarSelectedUsers {
  @override
  List<User> build() {
    return ref.watch(calendarUsersProvider);
  }

  // ignore: use_setters_to_change_properties
  void update(List<User> users) {
    state = users;
  }
}
