import 'package:meddly/features/sign_up/sign_up.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_password_error_message.g.dart';

@riverpod
String? passwordErrorMessage(PasswordErrorMessageRef ref) {
  final password =
      ref.watch(signUpControllerProvider.select((value) => value.password));

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !password.isPure
      ? password.error?.when(
          empty: () => l10n.passwordEmpty,
          invalid: () => l10n.invalidPassword,
          tooShort: () => l10n.passwordTooShort,
        )
      : null;
}
