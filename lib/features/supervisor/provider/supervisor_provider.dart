import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supervisor/supervisor.dart';
import 'package:user/user.dart';

part 'supervisor_provider.g.dart';

@riverpod
SupervisorApi supervisorApi(SupervisorApiRef ref) {
  return SupervisorApi(dio: ref.watch(dioProvider));
}

@riverpod
SupervisorRepository supervisorRepository(SupervisorRepositoryRef ref) {
  return SupervisorRepository(api: ref.watch(supervisorApiProvider));
}

@Riverpod(dependencies: [])
User supervisor(SupervisorRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [])
User supervised(SupervisedRef ref) {
  throw UnimplementedError();
}

@riverpod
class SelectedSupervised extends _$SelectedSupervised {
  @override
  List<User> build() {
    return [];
  }

  // ignore: use_setters_to_change_properties
  void update(List<User> users) {
    state = users;
    ref.keepAlive();
    ref.watch(calendarControllerProvider.notifier).refresh();
  }
}
