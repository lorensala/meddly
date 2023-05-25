import 'package:meddly/features/sign_up/provider/sign_up_password_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_password_error_message.g.dart';

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
