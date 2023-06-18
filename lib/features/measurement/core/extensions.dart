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

extension MeasurementUnitX on MeasurementUnit {
  String localizedString(AppLocalizations l10n) {
    return switch (this) {
      MeasurementUnit.mmHg => l10n.measurementUnitMmHg,
      MeasurementUnit.mgPerDL => l10n.measurementUnitMgPerDL,
      MeasurementUnit.kg => l10n.measurementUnitKg,
      MeasurementUnit.pounds => l10n.measurementUnitPounds,
      MeasurementUnit.cm => l10n.measurementUnitCm,
      MeasurementUnit.inches => l10n.measurementUnitInches,
      MeasurementUnit.celsius => l10n.measurementUnitCelsius,
      MeasurementUnit.fahrenheit => l10n.measurementUnitFahrenheit,
      MeasurementUnit.bpm => l10n.measurementUnitBpm,
      MeasurementUnit.percentage => l10n.measurementUnitPercentage,
      MeasurementUnit.breathsPerMin => l10n.measurementUnitBreathsPerMin,
      MeasurementUnit.kgPerSquareMeter => l10n.measurementUnitKgPerSquareMeter,
      MeasurementUnit.snellen => l10n.measurementUnitSnellen,
      MeasurementUnit.logMAR => l10n.measurementUnitLogMAR,
      MeasurementUnit.decibels => l10n.measurementUnitDecibels,
      MeasurementUnit.cellsPerUL => l10n.measurementUnitCellsPerUL,
      MeasurementUnit.millionsPerUL => l10n.measurementUnitMillionsPerUL,
      MeasurementUnit.thousandPerUL => l10n.measurementUnitThousandPerUL,
      MeasurementUnit.gramsPerDL => l10n.measurementUnitGramsPerDL,
      MeasurementUnit.ngPerML => l10n.measurementUnitNgPerML,
      MeasurementUnit.microgramsPerDL => l10n.measurementUnitMgPerDL,
      MeasurementUnit.other => l10n.other,
    };
  }
}
