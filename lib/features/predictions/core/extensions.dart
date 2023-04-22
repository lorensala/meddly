import 'package:meddly/l10n/l10n.dart';
import 'package:predictions/predictions.dart';

extension PredictionFailureX on PredictionFailure {
  String message(AppLocalizations l10n) {
    return maybeWhen(
      orElse: () => l10n.unknownError,
      notFound: () => l10n.medicineNotFound,
      sendTimeout: () => l10n.timeout,
      receiveTimeout: () => l10n.timeout,
      timeout: () => l10n.timeout,
    );
  }
}
