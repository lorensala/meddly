import 'package:authentication/authentication.dart';
import 'package:meddly/l10n/l10n.dart';

extension AuthFailureX on AuthFailure {
  String message(AppLocalizations l10n) {
    return maybeWhen(
      accountsExistsWithDifferentCredentials: () =>
          l10n.accountsExistsWithDifferentCredentials,
      serverError: () => l10n.serverError,
      emailAlreadyInUse: () => l10n.emailAlreadyInUse,
      operationNotAllowed: () => l10n.operationNotAllowed,
      userDisabled: () => l10n.userDisabled,
      userNotFound: () => l10n.userNotFound,
      wrongPassword: () => l10n.wrongPassword,
      tooManyRequests: () => l10n.tooManyRequests,
      invalidVerificationCode: () => l10n.invalidVerificationCode,
      invalidVerificationId: () => l10n.invalidVerificationId,
      invalidEmailAndPasswordCombination: () =>
          l10n.invalidEmailAndPasswordCombination,
      invalidEmail: () => l10n.invalidEmail,
      cancelledByUser: () => l10n.cancelledByUser,
      credentialAlreadyInUse: () => l10n.credentialAlreadyInUse,
      orElse: () => l10n.unknownError,
    );
  }
}
