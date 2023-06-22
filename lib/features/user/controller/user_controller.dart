import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  Stream<User?> build() {
    return ref.watch(userRepositoryProvider).user;
  }

  Future<void> createUser(User user) async {
    state = const AsyncLoading();
    final repository = ref.watch(userRepositoryProvider);

    final (err, _) = await repository.createUser(user);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err == null) {
      ref.read(goRouterProvider).go(PhonePage.routeName);
    } else {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }
  }

  Future<void> updateUser(User user) async {
    state = const AsyncLoading();
    final repository = ref.watch(userRepositoryProvider);

    final (err, _) = await repository.updateUser(user);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    }

    ref.read(goRouterProvider).pop();
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    final (cacheError, _) = ref.read(userRepositoryProvider).clearCache();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (cacheError != null) {
      state = AsyncError(cacheError.describe(l10n), StackTrace.current);
    }

    final (firebaseError, _) = await ref.read(authRepositoryProvider).signOut();

    if (firebaseError != null) {
      state = AsyncError(firebaseError.describe(l10n), StackTrace.current);
    }
  }
}
