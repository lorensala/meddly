import 'package:measurement/measurement.dart';

List<MeasurementUnit> getUnits(MeasurementType type) {
  switch (type) {
    case MeasurementType.bloodPressure:
      return [MeasurementUnit.mmHg, MeasurementUnit.other];
    case MeasurementType.bloodGlucose:
      return [MeasurementUnit.mgPerDL, MeasurementUnit.other];
    case MeasurementType.weight:
      return [
        MeasurementUnit.kg,
        MeasurementUnit.pounds,
        MeasurementUnit.other
      ];
    case MeasurementType.height:
      return [
        MeasurementUnit.cm,
        MeasurementUnit.inches,
        MeasurementUnit.other
      ];
    case MeasurementType.temperature:
      return [
        MeasurementUnit.celsius,
        MeasurementUnit.fahrenheit,
        MeasurementUnit.other
      ];
    case MeasurementType.heartRate:
      return [MeasurementUnit.bpm, MeasurementUnit.other];
    case MeasurementType.oxygenSaturation:
      return [MeasurementUnit.percentage, MeasurementUnit.other];
    case MeasurementType.respiratoryRate:
      return [MeasurementUnit.breathsPerMin, MeasurementUnit.other];
    case MeasurementType.cholesterol:
      return [MeasurementUnit.mgPerDL, MeasurementUnit.other];
    case MeasurementType.bodyMassIndex:
      return [MeasurementUnit.kgPerSquareMeter, MeasurementUnit.other];
    case MeasurementType.visionAcuity:
      return [
        MeasurementUnit.snellen,
        MeasurementUnit.logMAR,
        MeasurementUnit.other
      ];
    case MeasurementType.hearingAcuity:
      return [MeasurementUnit.decibels, MeasurementUnit.other];
    case MeasurementType.whiteBloodCellCount:
      return [MeasurementUnit.cellsPerUL, MeasurementUnit.other];
    case MeasurementType.redBloodCellCount:
      return [MeasurementUnit.millionsPerUL, MeasurementUnit.other];
    case MeasurementType.plateletCount:
      return [MeasurementUnit.thousandPerUL, MeasurementUnit.other];
    case MeasurementType.hemoglobinLevel:
      return [MeasurementUnit.gramsPerDL, MeasurementUnit.other];
    case MeasurementType.glucoseTolerance:
      return [MeasurementUnit.mgPerDL, MeasurementUnit.other];
    case MeasurementType.vitaminDLevels:
      return [MeasurementUnit.ngPerML, MeasurementUnit.other];
    case MeasurementType.ironLevels:
      return [MeasurementUnit.microgramsPerDL, MeasurementUnit.other];
    case MeasurementType.prostateSpecificAntigen:
      return [MeasurementUnit.ngPerML];
    case MeasurementType.urineAnalysis:
    case MeasurementType.liverFunction:
    case MeasurementType.kidneyFunction:
    case MeasurementType.thyroidFunction:
    case MeasurementType.electrolyteLevels:
    case MeasurementType.other:
      return [MeasurementUnit.other];
  }
}
