import 'package:measurement/measurement.dart';

enum MeasurementType {
  bloodPressure([MeasurementUnit.mmHg]),
  bloodGlucose([MeasurementUnit.mgPerDL]),
  weight([
    MeasurementUnit.kg,
    MeasurementUnit.pounds,
  ]),
  height([
    MeasurementUnit.cm,
    MeasurementUnit.inches,
  ]),
  temperature([
    MeasurementUnit.celsius,
    MeasurementUnit.fahrenheit,
  ]),
  heartRate([MeasurementUnit.bpm]),
  oxygenSaturation([MeasurementUnit.percentage]),
  respiratoryRate([MeasurementUnit.breathsPerMin]),
  cholesterol([MeasurementUnit.mgPerDL]),
  bodyMassIndex([MeasurementUnit.kgPerSquareMeter]),
  visionAcuity([
    MeasurementUnit.snellen,
    MeasurementUnit.logMAR,
  ]),
  hearingAcuity([MeasurementUnit.decibels]),
  urineAnalysis([
    MeasurementUnit.percentage,
  ]),
  liverFunction([
    MeasurementUnit.percentage,
  ]),
  kidneyFunction([
    MeasurementUnit.percentage,
  ]),
  thyroidFunction([
    MeasurementUnit.percentage,
  ]),
  electrolyteLevels([
    MeasurementUnit.percentage,
  ]),
  whiteBloodCellCount([
    MeasurementUnit.cellsPerUL,
  ]),
  redBloodCellCount([
    MeasurementUnit.millionsPerUL,
  ]),
  plateletCount([
    MeasurementUnit.thousandPerUL,
  ]),
  hemoglobinLevel([
    MeasurementUnit.gramsPerDL,
  ]),
  glucoseTolerance([
    MeasurementUnit.mgPerDL,
  ]),
  vitaminDLevels([
    MeasurementUnit.ngPerML,
  ]),
  ironLevels([
    MeasurementUnit.microgramsPerDL,
  ]),
  prostateSpecificAntigen([
    MeasurementUnit.ngPerML,
  ]),
  other([
    MeasurementUnit.other,
  ]);

  final List<MeasurementUnit> units;

  const MeasurementType(this.units);
}
