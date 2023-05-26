// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Consumption _$$_ConsumptionFromJson(Map<String, dynamic> json) =>
    _$_Consumption(
      medicineId: json['medicine_id'] as int,
      date: DateTime.parse(json['date'] as String),
      realConsumptionDate:
          DateTime.parse(json['real_consumption_date'] as String),
      consumed: json['consumed'] as bool,
    );

Map<String, dynamic> _$$_ConsumptionToJson(_$_Consumption instance) =>
    <String, dynamic>{
      'medicine_id': instance.medicineId,
      'date': instance.date.toIso8601String(),
      'real_consumption_date': instance.realConsumptionDate.toIso8601String(),
      'consumed': instance.consumed,
    };
