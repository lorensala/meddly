import 'package:formz/formz.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/forgot_password/state/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  @override
  ForgotPasswordState build() {
    return const ForgotPasswordState();
  }

  void onEmailChanged(String value) {
    final email = Email.dirty(value);
    state = state.copyWith(email: email, status: Formz.validate([email]));
  }

  void sendPasswordResetEmail() {
    if (state.status.isSubmissionInProgress) return;
    if (state.status.isInvalid) return;

    ref
        .read(authControllerProvider.notifier)
        .sendPasswordResetEmail(email: state.email.value);
  }
}
