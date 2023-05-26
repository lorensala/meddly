import 'package:meddly/features/sign_up/sign_up.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_email_error_message.g.dart';

@riverpod
String? emailErrorMessage(EmailErrorMessageRef ref) {
  final email =
      ref.watch(signUpControllerProvider.select((value) => value.email));

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !email.isPure
      ? email.error?.when(
          invalid: () => l10n.invalidEmail,
          empty: () => l10n.emailEmpty,
        )
      : null;
}
