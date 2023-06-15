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

extension MeasurementTypeX on MeasurementType {
  String localizedString(AppLocalizations l10n) {
    return switch (this) {
      MeasurementType.bloodGlucose => l10n.bloodGlucose,
      MeasurementType.bloodPressure => l10n.bloodPressure,
      MeasurementType.bodyMassIndex => l10n.bodyMassIndex,
      MeasurementType.cholesterol => l10n.cholesterol,
      MeasurementType.electrolyteLevels => l10n.electrolyteLevels,
      MeasurementType.glucoseTolerance => l10n.glucoseTolerance,
      MeasurementType.hearingAcuity => l10n.hearingAcuity,
      MeasurementType.heartRate => l10n.heartRate,
      MeasurementType.height => l10n.height,
      MeasurementType.hemoglobinLevel => l10n.hemoglobinLevel,
      MeasurementType.ironLevels => l10n.ironLevels,
      MeasurementType.kidneyFunction => l10n.kidneyFunction,
      MeasurementType.liverFunction => l10n.liverFunction,
      MeasurementType.oxygenSaturation => l10n.oxygenSaturation,
      MeasurementType.plateletCount => l10n.plateletCount,
      MeasurementType.prostateSpecificAntigen => l10n.prostateSpecificAntigen,
      MeasurementType.redBloodCellCount => l10n.redBloodCellCount,
      MeasurementType.respiratoryRate => l10n.respiratoryRate,
      MeasurementType.temperature => l10n.temperature,
      MeasurementType.thyroidFunction => l10n.thyroidFunction,
      MeasurementType.urineAnalysis => l10n.urineAnalysis,
      MeasurementType.visionAcuity => l10n.visionAcuity,
      MeasurementType.vitaminDLevels => l10n.vitaminDLevels,
      MeasurementType.weight => l10n.weight,
      MeasurementType.whiteBloodCellCount => l10n.whiteBloodCellCount,
      MeasurementType.other => l10n.other,
    };
  }
}
