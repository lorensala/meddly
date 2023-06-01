import 'package:meddly/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'user_provider.g.dart';

@riverpod
User? user(UserRef ref) {
  return ref.watch(userControllerProvider).whenOrNull(
    data: (user) {
      ref.keepAlive();
      return user;
    },
  );
}
