import 'package:meddly/l10n/l10n.dart';
import 'package:predictions/predictions.dart';

extension PredictionExceptionX on PredictionException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      PredictionUnknownException() => l10n.unknownError,
      PredictionNotFoundException() => l10n.unknownError,
      PredictionNotYoursException() => l10n.unknownError,
      PredictionInvalidException() => l10n.unknownError,
      PredictionAlreadyVerified() => l10n.unknownError,
      PredictionConnectionException() => l10n.unknownError,
      PredictionCancelException() => l10n.unknownError,
      PredictionSerializationException() => l10n.unknownError,
    };
  }
}
