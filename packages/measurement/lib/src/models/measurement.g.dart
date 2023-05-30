// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Measurement _$$_MeasurementFromJson(Map<String, dynamic> json) =>
    _$_Measurement(
      date: DateTime.parse(json['date'] as String),
      type: $enumDecode(_$MeasurementTypeEnumMap, json['type']),
      unit: $enumDecode(_$MeasurementUnitEnumMap, json['unit']),
      value: (json['value'] as num).toDouble(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_MeasurementToJson(_$_Measurement instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'type': _$MeasurementTypeEnumMap[instance.type]!,
      'unit': _$MeasurementUnitEnumMap[instance.unit]!,
      'value': instance.value,
      'id': instance.id,
    };

const _$MeasurementTypeEnumMap = {
  MeasurementType.bloodPressure: 'bloodPressure',
  MeasurementType.bloodGlucose: 'bloodGlucose',
  MeasurementType.weight: 'weight',
  MeasurementType.height: 'height',
  MeasurementType.temperature: 'temperature',
  MeasurementType.heartRate: 'heartRate',
  MeasurementType.oxygenSaturation: 'oxygenSaturation',
  MeasurementType.respiratoryRate: 'respiratoryRate',
  MeasurementType.cholesterol: 'cholesterol',
  MeasurementType.bodyMassIndex: 'bodyMassIndex',
  MeasurementType.visionAcuity: 'visionAcuity',
  MeasurementType.hearingAcuity: 'hearingAcuity',
  MeasurementType.urineAnalysis: 'urineAnalysis',
  MeasurementType.liverFunction: 'liverFunction',
  MeasurementType.kidneyFunction: 'kidneyFunction',
  MeasurementType.thyroidFunction: 'thyroidFunction',
  MeasurementType.electrolyteLevels: 'electrolyteLevels',
  MeasurementType.whiteBloodCellCount: 'whiteBloodCellCount',
  MeasurementType.redBloodCellCount: 'redBloodCellCount',
  MeasurementType.plateletCount: 'plateletCount',
  MeasurementType.hemoglobinLevel: 'hemoglobinLevel',
  MeasurementType.glucoseTolerance: 'glucoseTolerance',
  MeasurementType.vitaminDLevels: 'vitaminDLevels',
  MeasurementType.ironLevels: 'ironLevels',
  MeasurementType.prostateSpecificAntigen: 'prostateSpecificAntigen',
  MeasurementType.other: 'other',
};

const _$MeasurementUnitEnumMap = {
  MeasurementUnit.mmHg: 'mmHg',
  MeasurementUnit.mgPerDL: 'mgPerDL',
  MeasurementUnit.kg: 'kg',
  MeasurementUnit.pounds: 'pounds',
  MeasurementUnit.cm: 'cm',
  MeasurementUnit.inches: 'inches',
  MeasurementUnit.celsius: 'celsius',
  MeasurementUnit.fahrenheit: 'fahrenheit',
  MeasurementUnit.bpm: 'bpm',
  MeasurementUnit.percentage: 'percentage',
  MeasurementUnit.breathsPerMin: 'breathsPerMin',
  MeasurementUnit.kgPerSquareMeter: 'kgPerSquareMeter',
  MeasurementUnit.snellen: 'snellen',
  MeasurementUnit.logMAR: 'logMAR',
  MeasurementUnit.decibels: 'decibels',
  MeasurementUnit.cellsPerUL: 'cellsPerUL',
  MeasurementUnit.millionsPerUL: 'millionsPerUL',
  MeasurementUnit.thousandPerUL: 'thousandPerUL',
  MeasurementUnit.gramsPerDL: 'gramsPerDL',
  MeasurementUnit.ngPerML: 'ngPerML',
  MeasurementUnit.microgramsPerDL: 'microgramsPerDL',
  MeasurementUnit.other: 'other',
};
