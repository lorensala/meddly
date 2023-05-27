import 'package:appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';

extension AppointmentExceptionX on AppointmentException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      AppointmentUnknownException() => l10n.unknownError,
      AppointmentNotFoundException() => l10n.unknownError,
      AppointmentSerializationException() => l10n.unknownError,
      AppointmentConnectionException() => l10n.unknownError,
      AppointmentNotYoursException() => l10n.unknownError,
    };
  }
}
