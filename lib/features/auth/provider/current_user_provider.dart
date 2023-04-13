import 'package:firebase_auth/firebase_auth.dart';
import 'package:meddly/features/auth/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_provider.g.dart';

@riverpod
User? currentUser(CurrentUserRef ref) {
  return ref.watch(authRepositoryProvider).currentUser;
}
