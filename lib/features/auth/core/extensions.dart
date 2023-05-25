import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:meddly/l10n/l10n.dart';

extension AuthExceptionX on AuthException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      InvalidEmailException() => l10n.invalidEmail,
      UserDisabledException() => l10n.userDisabled,
      UserNotFoundException() => l10n.userNotFound,
      WrongPasswordException() => l10n.wrongPassword,
      UnknownAuthException() => l10n.unknownError,
      WeakPasswordException() => l10n.weakPassword,
      EmailAlreadyInUseException() => l10n.emailAlreadyInUse,
      InvalidActionCodeException() => l10n.invalidActionCode,
      ExpiredActionCodeException() => l10n.expiredActionCode,
      RequiresRecentLoginException() => l10n.requiresRecentLogin,
      InvalidVerificationCodeException() => l10n.invalidVerificationCode,
      InvalidVerificationIdException() => l10n.invalidVerificationId,
      InvalidPhoneNumberException() => l10n.invalidPhoneNumber,
      TooManyRequestsException() => l10n.tooManyRequests,
      LogInWithGoogleException() => l10n.logInWithGoogleError
    };
  }
}
