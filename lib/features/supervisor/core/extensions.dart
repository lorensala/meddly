import 'package:meddly/l10n/l10n.dart';
import 'package:supervisor/supervisor.dart';

extension SupervisorExceptionX on SupervisorException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      SupervisorIsAlreadyYoutSupervisorException() =>
        l10n.alreadyYourSupervisor,
      SupervisorInvalidInvitationCodeException() => l10n.invalidInvitationCode,
      SupervisorNotFoundException() => l10n.supervisorNotFound,
      SupervisedNotFoundException() => l10n.supervisedNotFound,
      SupervisorCantSuperviseYourselfException() => l10n.cantSuperviseYourself,
      SupervisorConnectionException() => l10n.connectionError,
      SupervisorUnknownException() => l10n.unknownError,
      SupervisorSerializationException() => l10n.unknownError,
    };
  }
}
