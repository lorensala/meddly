import 'package:measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';

extension MeasurementExceptionX on MeasurementException {
  String describe(AppLocalizations l10n) {
    return switch (this) {
      MeasurementNotFoundException() => l10n.measurementNotFound,
      MeasurementNotYoursException() => l10n.unknownError,
      MeasurementConnectionException() => l10n.connectionError,
      MeasurementCancelException() => l10n.unknownError,
      MeasurementSerializationException() => l10n.unknownError,
      MeasurementUnknownException() => l10n.unknownError,
    };
  }
}
