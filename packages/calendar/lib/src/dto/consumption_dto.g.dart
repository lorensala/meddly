// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConsumptionDto _$$_ConsumptionDtoFromJson(Map<String, dynamic> json) =>
    _$_ConsumptionDto(
      date: json['date'] as String,
      realConsumptionDate: json['real_consumption_date'] as String,
      medicineId: json['medicine_id'] as int,
      consumed: json['consumed'] as bool,
    );

Map<String, dynamic> _$$_ConsumptionDtoToJson(_$_ConsumptionDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'real_consumption_date': instance.realConsumptionDate,
      'medicine_id': instance.medicineId,
      'consumed': instance.consumed,
    };
