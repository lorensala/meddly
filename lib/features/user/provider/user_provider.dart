import 'package:dartz/dartz.dart';
import 'package:meddly/features/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user/user.dart';

part 'user_provider.g.dart';

@riverpod
Option<User> user(UserRef ref) {
  return ref.watch(userControllerProvider).maybeWhen(
        data: (user) {
          return user;
        },
        orElse: none,
      );
}
