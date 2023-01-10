// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicineDto _$$_MedicineDtoFromJson(Map<String, dynamic> json) =>
    _$_MedicineDto(
      id: json['id'] as int,
      name: json['name'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      stock: json['stock'] as int?,
      stockWarning: json['stock_warning'] as int?,
      presentation: json['presentation'] as String,
      dosisUnit: json['dosis_unit'] as String,
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
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'stock': instance.stock,
      'stock_warning': instance.stockWarning,
      'presentation': instance.presentation,
      'dosis_unit': instance.dosisUnit,
      'dosis': instance.dosis,
      'interval': instance.interval,
      'days': instance.days,
      'hours': instance.hours,
      'instructions': instance.instructions,
    };
