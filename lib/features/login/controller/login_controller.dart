import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/login/state/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState build() {
    return const LoginState();
  }

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email,
    );
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
    );
  }

  void logInWithEmailAndPassword() {
    if (state.isNotValid) return;
    ref.read(authControllerProvider.notifier).logInWithEmailAndPassword(
          email: state.email.value.trim(),
          password: state.password.value.trim(),
        );
  }
}
