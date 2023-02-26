import 'package:calendar/calendar.dart';
import 'package:meddly/l10n/l10n.dart';

extension MedicineFailureX on MedicineFailure {
  String message(AppLocalizations l10n) {
    return maybeWhen(
      orElse: () => l10n.unknownError,
      notFound: () => l10n.medicineNotFound,
      sendTimeout: () => l10n.timeout,
      receiveTimeout: () => l10n.timeout,
      connectionTimeOut: () => l10n.timeout,
    );
  }
}
