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

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(
    api: ref.watch(userApiProvider),
    cache: ref.watch(userCacheProvider),
  );
}
