import 'package:meddly/features/forgot_password/controller/forgot_password_controller.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_provider.g.dart';

@riverpod
String? forgotPasswordEmailError(ForgotPasswordEmailErrorRef ref) {
  final email = ref
      .watch(forgotPasswordControllerProvider.select((value) => value.email));

  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !email.isPure
      ? email.error?.when(
          invalid: () => l10n.invalidEmail,
          empty: () => l10n.emailEmpty,
        )
      : null;
}
