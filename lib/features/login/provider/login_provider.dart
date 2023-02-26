import 'package:meddly/features/login/controller/login_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'login_provider.g.dart';

@riverpod
Email loginEmail(LoginEmailRef ref) {
  return ref.watch(loginControllerProvider).email;
}

@riverpod
Password loginPassword(LoginPasswordRef ref) {
  return ref.watch(loginControllerProvider).password;
}

@riverpod
bool isLoginFormValid(IsLoginFormValidRef ref) {
  final state = ref.watch(loginControllerProvider);
  return state.email.value.isNotEmpty && state.password.value.isNotEmpty;
}
