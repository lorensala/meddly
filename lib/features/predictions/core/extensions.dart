import 'package:meddly/l10n/l10n.dart';
import 'package:predictions/predictions.dart';

extension PredictionExceptionX on PredictionException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      PredictionUnknownException() => l10n.unknownError,
      PredictionNotFoundException() => l10n.predictionNotFound,
      PredictionNotYoursException() => l10n.predictionNotYours,
      PredictionInvalidException() => l10n.predictionInvalid,
      PredictionAlreadyVerified() => l10n.predictionAlreadyVerified,
      PredictionConnectionException() => l10n.connectionError,
      PredictionCancelException() => l10n.unknownError,
      PredictionSerializationException() => l10n.unknownError,
    };
  }
}
