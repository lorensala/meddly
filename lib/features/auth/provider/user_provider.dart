import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:meddly/features/auth/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
User user(UserRef ref) {
  return ref.watch(authRepositoryProvider).user;
}
