import 'package:authentication/authentication.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}

@riverpod
User? currentUser(CurrentUserRef ref) {
  return ref.watch(authRepositoryProvider).currentUser;
}

@riverpod
Stream<Option<User>> authChanges(AuthChangesRef ref) {
  return ref.watch(authRepositoryProvider).user;
}
