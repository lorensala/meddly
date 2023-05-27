import 'package:calendar/calendar.dart';
import 'package:meddly/l10n/l10n.dart';

extension CalendarExceptionX on CalendarException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      CalendarUnknownException() => l10n.unknownError,
      CalendarNotFoundException() => l10n.unknownError,
      CalendarSerializationException() => l10n.unknownError,
      CalendarConnectionException() => l10n.connectionError,
    };
  }
}
