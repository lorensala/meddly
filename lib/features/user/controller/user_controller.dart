import 'package:dartz/dartz.dart';
import 'package:meddly/core/extensions.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

import '../../../l10n/l10n.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {
  @override
  Stream<Option<User>> build() {
    return ref.watch(userRepositoryProvider).user;
  }

  Future<void> createUser(User user) async {
    state = const AsyncLoading();
    final repository = ref.watch(userRepositoryProvider);

    final res = await repository.createUser(user);

    final l10n = ref.read(l10nProvider) as AppLocalizations;
    ;

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }
  }

  Future<void> updateUser(User user) async {
    state = const AsyncLoading();
    final repository = ref.watch(userRepositoryProvider);

    final res = await repository.updateUser(user);

    final l10n = ref.read(l10nProvider) as AppLocalizations;
    ;

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    ref.read(userRepositoryProvider).clearCache();

    final res = await ref.read(authRepositoryProvider).signOut();

    final l10n = ref.read(l10nProvider) as AppLocalizations;
    ;

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
    }
  }
}
