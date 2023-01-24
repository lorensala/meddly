import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// {@template auth_failure}
/// This is the error that is thrown when an error occurs during authentication.
/// {@endtemplate}
@freezed
class AuthFailure with _$AuthFailure {
  const AuthFailure._();

  /// {@macro auth_failure}
  const factory AuthFailure.cancelledByUser() = CancelledByUser;

  /// {@macro auth_failure}
  const factory AuthFailure.accountsExistsWithDifferentCredentials() =
      AccountsExistsWithDifferentCredentials;

  /// {@macro auth_failure}
  const factory AuthFailure.serverError() = ServerError;

  /// {@macro auth_failure}
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;

  /// {@macro auth_failure}
  const factory AuthFailure.operationNotAllowed() = OperationNotAllowed;

  /// {@macro auth_failure}
  const factory AuthFailure.userDisabled() = UserDisabled;

  /// {@macro auth_failure}
  const factory AuthFailure.userNotFound() = UserNotFound;

  /// {@macro auth_failure}
  const factory AuthFailure.wrongPassword() = WrongPassword;

  /// {@macro auth_failure}
  const factory AuthFailure.tooManyRequests() = TooManyRequests;

  /// {@macro auth_failure}
  const factory AuthFailure.unknownError() = UnknownError;

  /// {@macro auth_failure}
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;

  /// {@macro auth_failure}
  const factory AuthFailure.invalidEmail() = InvalidEmail;

  /// {@macro auth_failure}
  const factory AuthFailure.invalidVerificationCode() = InvalidVerificationCode;

  /// {@macro auth_failure}
  const factory AuthFailure.invalidVerificationId() = InvalidVerificationId;

  /// {@macro auth_failure}
  const factory AuthFailure.invalidPhoneNumber() = InvalidPhoneNumber;

  /// {@macro auth_failure}
  const factory AuthFailure.invalidCredential() = InvalidCredential;

  /// {@macro auth_failure}
  const factory AuthFailure.weakPassword() = WeakPassword;

  /// {@macro auth_failure}
  const factory AuthFailure.requiresRecentLogin() = RequiresRecentLogin;

  /// {@macro auth_failure}
  const factory AuthFailure.credentialAlreadyInUse() = CredentialAlreadyInUse;

  /// {@macro auth_failure}
  factory AuthFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const AuthFailure.invalidEmail();
      case 'user-not-found':
        return const AuthFailure.userNotFound();
      case 'account-exists-with-different-credential':
        return const AuthFailure.accountsExistsWithDifferentCredentials();
      case 'invalid-credential':
        return const AuthFailure.invalidCredential();
      case 'operation-not-allowed':
        return const AuthFailure.operationNotAllowed();
      case 'user-disabled':
        return const AuthFailure.userDisabled();
      case 'email-already-in-use':
        return const AuthFailure.emailAlreadyInUse();
      case 'weak-password':
        return const AuthFailure.weakPassword();
      case 'wrong-password':
        return const AuthFailure.wrongPassword();
      case 'invalid-verification-code':
        return const AuthFailure.invalidVerificationCode();
      case 'invalid-verification-id':
        return const AuthFailure.invalidVerificationId();
      case 'requires-recent-login':
        return const AuthFailure.requiresRecentLogin();
      case 'credential-already-in-use':
        return const AuthFailure.credentialAlreadyInUse();
      default:
        return const AuthFailure.unknownError();
    }
  }
}
