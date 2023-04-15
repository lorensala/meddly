import 'package:meddly/features/sign_up/provider/sign_up_email_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_email_error_message.g.dart';

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
