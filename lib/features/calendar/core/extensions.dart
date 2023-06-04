import 'package:calendar/calendar.dart';
import 'package:meddly/l10n/l10n.dart';

extension CalendarExceptionX on CalendarException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      CalendarUnknownException() => l10n.unknownError,
      CalendarNotFoundException() => l10n.calendarNotFoundError,
      CalendarSerializationException() => l10n.unknownError,
      CalendarConnectionException() => l10n.connectionError,
      CalendarAlreadyConsumedException() => l10n.alreadyConsumedError,
      CalendarConsumptionDoesNotExistException() =>
        l10n.consumptionDoesNotExistError,
    };
  }
}
