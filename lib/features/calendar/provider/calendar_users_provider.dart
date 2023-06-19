import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'calendar_users_provider.g.dart';

@riverpod
List<User> calendarUsers(CalendarUsersRef ref) {
  final res = ref.watch(supervisorControllerProvider);

  final supervisors = res.whenOrNull(
    data: (data) {
      return data.supervised;
    },
  );

  if (supervisors == null) {
    return [];
  }

  final user = ref.watch(userProvider);

  if (user == null) {
    return [];
  }

  return [user, ...supervisors];
}
