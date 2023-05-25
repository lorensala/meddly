import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'user_cache_provider.g.dart';

@riverpod
UserCache userCache(UserCacheRef ref) {
  return UserCache(ref.watch(userBoxProvider));
}
