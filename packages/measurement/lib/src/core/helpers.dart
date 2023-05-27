import 'package:measurement/measurement.dart';

List<MeasurementUnit> getUnits(MeasurementType type) {
  switch (type) {
    case MeasurementType.bloodPressure:
      return [MeasurementUnit.mmHg];
    case MeasurementType.bloodGlucose:
      return [MeasurementUnit.mgPerDL];
    case MeasurementType.weight:
      return [MeasurementUnit.kg, MeasurementUnit.pounds];
    case MeasurementType.height:
      return [MeasurementUnit.cm, MeasurementUnit.inches];
    case MeasurementType.temperature:
      return [MeasurementUnit.celsius, MeasurementUnit.fahrenheit];
    case MeasurementType.heartRate:
      return [MeasurementUnit.bpm];
    case MeasurementType.oxygenSaturation:
      return [MeasurementUnit.percentage];
    case MeasurementType.respiratoryRate:
      return [MeasurementUnit.breathsPerMin];
    case MeasurementType.cholesterol:
      return [MeasurementUnit.mgPerDL];
    case MeasurementType.bodyMassIndex:
      return [MeasurementUnit.kgPerSquareMeter];
    case MeasurementType.visionAcuity:
      return [MeasurementUnit.snellen, MeasurementUnit.logMAR];
    case MeasurementType.hearingAcuity:
      return [MeasurementUnit.decibels];
    case MeasurementType.urineAnalysis:
      return [];
    case MeasurementType.liverFunction:
      return [];
    case MeasurementType.kidneyFunction:
      return [];
    case MeasurementType.thyroidFunction:
      return [];
    case MeasurementType.electrolyteLevels:
      return [];
    case MeasurementType.whiteBloodCellCount:
      return [MeasurementUnit.cellsPerUL];
    case MeasurementType.redBloodCellCount:
      return [MeasurementUnit.millionsPerUL];
    case MeasurementType.plateletCount:
      return [MeasurementUnit.thousandPerUL];
    case MeasurementType.hemoglobinLevel:
      return [MeasurementUnit.gramsPerDL];
    case MeasurementType.glucoseTolerance:
      return [MeasurementUnit.mgPerDL];
    case MeasurementType.vitaminDLevels:
      return [MeasurementUnit.ngPerML];
    case MeasurementType.ironLevels:
      return [MeasurementUnit.microgramsPerDL];
    case MeasurementType.prostateSpecificAntigen:
      return [MeasurementUnit.ngPerML];
    case MeasurementType.other:
      return [];
    default:
      return [];
  }
}
