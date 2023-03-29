import 'package:meddly/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'user_api_provider.g.dart';

@riverpod
UserApi userApi(UserApiRef ref) {
  return UserApi(ref.watch(dioProvider));
}
