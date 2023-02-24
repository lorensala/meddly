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
bool checkIfUserExist(CheckIfUserExistRef ref) {
  final repository = ref.watch(userRepositoryProvider);

  final res = repository.getUser();

  if (res.isLeft()) {
    return false;
  }

  final userOrNull = res.asRight();

  if (userOrNull == null) {
    return false;
  }

  return true;
}
