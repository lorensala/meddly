import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'user_provider.g.dart';

@riverpod
UserApi userApi(UserApiRef ref) {
  return UserApi(ref.watch(dioProvider));
}

@riverpod
UserCache userCache(UserCacheRef ref) {
  return UserCache(ref.watch(userBoxProvider));
}

final userStreamProvider = StreamProvider<Option<User>>((ref) {
  return ref.read(userRepositoryProvider).user;
});

@riverpod
Option<User> user(UserRef ref) {
  return ref.watch(userStreamProvider).maybeWhen(
        data: (user) {
          return user;
        },
        orElse: none,
      );
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(
    api: ref.watch(userApiProvider),
    cache: ref.watch(userCacheProvider),
  );
}

@riverpod
Future<bool> checkIfUserExist(CheckIfUserExistRef ref) async {
  final repository = ref.watch(userRepositoryProvider);

  final res = repository.getUser();

  if (res.isLeft()) {
    return Future.value(false);
  }

  final userOrNull = res.asRight();

  if (userOrNull == null) {
    final res = await repository.fetchUser();

    // TODO(lorenzo): check when there's connection.
    return res.fold(
      (l) => false,
      (r) => true,
    );

    // ref.invalidateSelf();
  }

  return true;
}
