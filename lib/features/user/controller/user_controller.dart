import 'package:meddly/features/user/provider/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  FutureOr<void> build() {}

  Future<void> createUser(User user) async {
    state = const AsyncLoading();
    final repository = ref.watch(userRepositoryProvider);

    final res = await repository.createUser(user);

    res.fold(
      (l) => state = AsyncError(l, StackTrace.current),
      (_) => state = const AsyncData(null),
    );
  }
}
