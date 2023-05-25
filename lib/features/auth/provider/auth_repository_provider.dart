import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
FirebaseAuthRepository authRepository(AuthRepositoryRef ref) {
  return FirebaseAuthRepository();
}
