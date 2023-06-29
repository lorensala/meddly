import 'package:measurement/measurement.dart';

enum MeasurementType {
  bloodGlucose([MeasurementUnit.mgPerDL]),
  bloodPressure([MeasurementUnit.mmHg]),
  bodyMassIndex([MeasurementUnit.kgPerSquareMeter]),
  cholesterol([MeasurementUnit.mgPerDL]),
  electrolyteLevels([MeasurementUnit.percentage]),
  glucoseTolerance([MeasurementUnit.mgPerDL]),
  hearingAcuity([MeasurementUnit.decibels]),
  heartRate([MeasurementUnit.bpm]),
  height([MeasurementUnit.cm, MeasurementUnit.inches]),
  hemoglobinLevel([MeasurementUnit.gramsPerDL]),
  ironLevels([MeasurementUnit.microgramsPerDL]),
  kidneyFunction([MeasurementUnit.percentage]),
  liverFunction([MeasurementUnit.percentage]),
  other([MeasurementUnit.other]),
  oxygenSaturation([MeasurementUnit.percentage]),
  plateletCount([MeasurementUnit.thousandPerUL]),
  prostateSpecificAntigen([MeasurementUnit.ngPerML]),
  redBloodCellCount([MeasurementUnit.millionsPerUL]),
  respiratoryRate([MeasurementUnit.breathsPerMin]),
  temperature([MeasurementUnit.celsius, MeasurementUnit.fahrenheit]),
  thyroidFunction([MeasurementUnit.percentage]),
  urineAnalysis([MeasurementUnit.percentage]),
  visionAcuity([MeasurementUnit.snellen, MeasurementUnit.logMAR]),
  vitaminDLevels([MeasurementUnit.ngPerML]),
  weight([MeasurementUnit.kg, MeasurementUnit.pounds]),
  whiteBloodCellCount([MeasurementUnit.cellsPerUL]);

  final List<MeasurementUnit> units;

  const MeasurementType(this.units);
}
