import 'package:meddly/features/login/controller/login_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_login_form_valid_provider.g.dart';

@riverpod
bool isLoginFormValid(IsLoginFormValidRef ref) {
  final state = ref.watch(loginControllerProvider);
  return state.email.value.isNotEmpty && state.password.value.isNotEmpty;
}
