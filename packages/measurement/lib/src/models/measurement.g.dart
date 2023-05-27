// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Measurement _$$_MeasurementFromJson(Map<String, dynamic> json) =>
    _$_Measurement(
      date: DateTime.parse(json['date'] as String),
      type: $enumDecode(_$MeasurementTypeEnumMap, json['type']),
      value: (json['value'] as num).toDouble(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_MeasurementToJson(_$_Measurement instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'type': _$MeasurementTypeEnumMap[instance.type]!,
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
  MeasurementType.other: 'other',
};
