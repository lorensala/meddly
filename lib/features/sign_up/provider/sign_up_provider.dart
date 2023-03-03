import 'package:formz/formz.dart';
import 'package:meddly/features/sign_up/controller/sign_up_controller.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'sign_up_provider.g.dart';

@riverpod
Email signUpEmail(SignUpEmailRef ref) {
  return ref.watch(signUpControllerProvider).email;
}

@riverpod
Password signUpPassword(SignUpPasswordRef ref) {
  return ref.watch(signUpControllerProvider).password;
}

@riverpod
TermsAndConditions termsAndConditions(TermsAndConditionsRef ref) {
  return ref.watch(signUpControllerProvider).termsAndConditions;
}

@riverpod
bool isSignUpFormValid(IsSignUpFormValidRef ref) {
  return ref.watch(signUpControllerProvider).status.isValid;
}

@riverpod
bool isSignUpEmailValid(IsSignUpEmailValidRef ref) {
  return ref.watch(signUpEmailProvider).valid;
}

@riverpod
bool isSignUpPasswordValid(IsSignUpPasswordValidRef ref) {
  return ref.watch(signUpPasswordProvider).valid;
}

@riverpod
String? emailErrorMessage(EmailErrorMessageRef ref) {
  final email = ref.watch(signUpEmailProvider);

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !email.pure
      ? email.error?.when(
          invalid: () => l10n.invalidEmail,
          empty: () => l10n.emailEmpty,
        )
      : null;
}

@riverpod
String? passwordErrorMessage(PasswordErrorMessageRef ref) {
  final password = ref.watch(signUpPasswordProvider);

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !password.pure
      ? password.error?.when(
          empty: () => l10n.passwordEmpty,
          invalid: () => l10n.invalidPassword,
          tooShort: () => l10n.passwordTooShort,
        )
      : null;
}
