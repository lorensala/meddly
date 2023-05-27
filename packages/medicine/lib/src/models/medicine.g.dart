// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Medicine _$$_MedicineFromJson(Map<String, dynamic> json) => _$_Medicine(
      id: json['id'] as int,
      name: json['name'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      stock: json['stock'] as int?,
      stockWarning: json['stock_warning'] as int?,
      presentation:
          $enumDecode(_$MedicinePresentationEnumMap, json['presentation']),
      dosisUnit: $enumDecode(_$MedicineDosisUnitEnumMap, json['dosis_unit']),
      dosis: (json['dosis'] as num).toDouble(),
      interval: json['interval'] as int?,
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$MedicineDayEnumMap, e))
          .toList(),
      hours: const ListTimeOfDayOrNullConverter()
          .fromJson(json['hours'] as List<String>?),
      instructions: json['instructions'] as String?,
    );

Map<String, dynamic> _$$_MedicineToJson(_$_Medicine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'stock': instance.stock,
      'stock_warning': instance.stockWarning,
      'presentation': _$MedicinePresentationEnumMap[instance.presentation]!,
      'dosis_unit': _$MedicineDosisUnitEnumMap[instance.dosisUnit]!,
      'dosis': instance.dosis,
      'interval': instance.interval,
      'days': instance.days?.map((e) => _$MedicineDayEnumMap[e]!).toList(),
      'hours': const ListTimeOfDayOrNullConverter().toJson(instance.hours),
      'instructions': instance.instructions,
    };

const _$MedicinePresentationEnumMap = {
  MedicinePresentation.capusle: 'capusle',
  MedicinePresentation.tablet: 'tablet',
  MedicinePresentation.liquid: 'liquid',
  MedicinePresentation.topical: 'topical',
  MedicinePresentation.cream: 'cream',
  MedicinePresentation.device: 'device',
  MedicinePresentation.drops: 'drops',
  MedicinePresentation.foam: 'foam',
  MedicinePresentation.gel: 'gel',
  MedicinePresentation.inhaler: 'inhaler',
  MedicinePresentation.injection: 'injection',
  MedicinePresentation.lotion: 'lotion',
  MedicinePresentation.ointment: 'ointment',
  MedicinePresentation.patch: 'patch',
  MedicinePresentation.powder: 'powder',
  MedicinePresentation.spray: 'spray',
  MedicinePresentation.suppository: 'suppository',
};

const _$MedicineDosisUnitEnumMap = {
  MedicineDosisUnit.mg: 'mg',
  MedicineDosisUnit.mcg: 'mcg',
  MedicineDosisUnit.g: 'g',
  MedicineDosisUnit.mL: 'mL',
  MedicineDosisUnit.percentage: 'percentage',
};

const _$MedicineDayEnumMap = {
  MedicineDay.monday: 'monday',
  MedicineDay.tuesday: 'tuesday',
  MedicineDay.wednesday: 'wednesday',
  MedicineDay.thursday: 'thursday',
  MedicineDay.friday: 'friday',
  MedicineDay.saturday: 'saturday',
  MedicineDay.sunday: 'sunday',
};
