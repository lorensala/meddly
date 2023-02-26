import 'package:meddly/features/auth/auth.dart';
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

    state = res.fold(
      (l) => AsyncError(l, StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> updateUser(User user) async {
    state = const AsyncLoading();
    final repository = ref.watch(userRepositoryProvider);

    final res = await repository.updateUser(user);

    state = res.fold(
      (l) => AsyncError(l, StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    ref.read(userRepositoryProvider).clearCache();

    final res = await ref.read(authRepositoryProvider).signOut();

    state = res.fold(
      (l) => AsyncError(l, StackTrace.current),
      (_) => const AsyncData(null),
    );
  }
}
