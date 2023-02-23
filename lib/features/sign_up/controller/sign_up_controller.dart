import 'package:formz/formz.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/sign_up/cubit/cubit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'sign_up_controller.g.dart';

@riverpod
class SignUpController extends _$SignUpController {
  @override
  SignUpState build() {
    return const SignUpState();
  }

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(
      email: email,
      status: Formz.validate([email, state.password, state.termsAndConditions]),
    );
  }

  void onPasswordChanged(String value) {
    final password = Password.dirty(value);

    state = state.copyWith(
      password: password,
      status: Formz.validate([state.email, password, state.termsAndConditions]),
    );
  }

  void onTermsAcceptedChanged({required bool value}) {
    final termsAndConditions = TermsAndConditions.dirty(value: value);
    state = state.copyWith(
      termsAndConditions: termsAndConditions,
      status: Formz.validate([state.email, state.password, termsAndConditions]),
    );
  }

  void registerWithEmailAndPassword() {
    ref.read(authControllerProvider.notifier).reigsterWithEmailAndPassword(
          email: state.email.value.trim(),
          password: state.password.value.trim(),
        );
  }
}
