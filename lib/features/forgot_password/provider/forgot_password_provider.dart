import 'package:meddly/features/forgot_password/forgot_password.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'forgot_password_provider.g.dart';

@riverpod
Email forgotPasswordEmail(ForgotPasswordEmailRef ref) {
  return ref.watch(forgotPasswordControllerProvider).email;
}

@riverpod
bool isForgotPasswordEmailValid(IsForgotPasswordEmailValidRef ref) {
  return ref.watch(forgotPasswordEmailProvider).valid;
}

@riverpod
String? forgotPasswordEmailError(ForgotPasswordEmailErrorRef ref) {
  final email = ref.watch(forgotPasswordEmailProvider);

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !email.pure
      ? email.error?.when(
          invalid: () => l10n.invalidEmail,
          empty: () => l10n.emailEmpty,
        )
      : null;
}
