import 'package:meddly/features/supervisor/controller/controller.dart';
import 'package:meddly/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'calendar_selected_users_provider.g.dart';

@riverpod
class CalendarSelectedUsers extends _$CalendarSelectedUsers {
  @override
  List<User> build() {
    final me = ref.watch(userProvider);
    return ref.watch(supervisorControllerProvider).when(
          data: (users) {
            if (me == null) {
              return const [];
            }

            return [me, ...users.supervised];
          },
          loading: () => const [],
          error: (err, _) => [],
        );
  }

  // ignore: use_setters_to_change_properties
  void update(List<User> users) {
    state = users;
  }
}
