import 'package:meddly/features/user/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(
    api: ref.watch(userApiProvider),
    cache: ref.watch(userCacheProvider),
  );
}
