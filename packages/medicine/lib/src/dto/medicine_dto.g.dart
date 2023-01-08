// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicineDto _$$_MedicineDtoFromJson(Map<String, dynamic> json) =>
    _$_MedicineDto(
      id: json['id'] as int,
      name: json['name'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      stock: json['stock'] as int?,
      stockWarning: json['stockWarning'] as int?,
      presentation: json['presentation'] as String,
      dosisUnit: json['dosisUnit'] as String,
      dosis: (json['dosis'] as num).toDouble(),
      interval: json['interval'] as int?,
      days: (json['days'] as List<dynamic>?)?.map((e) => e as int).toList(),
      hours:
          (json['hours'] as List<dynamic>?)?.map((e) => e as String).toList(),
      instructions: json['instructions'] as String?,
    );

Map<String, dynamic> _$$_MedicineDtoToJson(_$_MedicineDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'stock': instance.stock,
      'stockWarning': instance.stockWarning,
      'presentation': instance.presentation,
      'dosisUnit': instance.dosisUnit,
      'dosis': instance.dosis,
      'interval': instance.interval,
      'days': instance.days,
      'hours': instance.hours,
      'instructions': instance.instructions,
    };
