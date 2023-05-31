import 'package:meddly/l10n/l10n.dart';
import 'package:supervisor/supervisor.dart';

extension SupervisorExceptionX on SupervisorException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      SupervisorSerializationException() => l10n.unknownError,
      SupervisorIsAlreadyYoutSupervisorException() => l10n.unknownError,
      SupervisorInvalidInvitationCodeException() => l10n.unknownError,
      SupervisorNotFoundException() => l10n.unknownError,
      SupervisedNotFoundException() => l10n.unknownError,
      SupervisorCantSuperviseYourselfException() => l10n.unknownError,
      SupervisorConnectionException() => l10n.unknownError,
      SupervisorUnknownException() => l10n.unknownError,
    };
  }
}
