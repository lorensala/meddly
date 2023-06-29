// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineAdapter extends TypeAdapter<Medicine> {
  @override
  final int typeId = 2;

  @override
  Medicine read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Medicine(
      id: fields[0] as int,
      name: fields[1] as String,
      startDate: fields[2] as DateTime,
      endDate: fields[3] as DateTime?,
      stock: fields[4] as int?,
      stockWarning: fields[5] as int?,
      presentation: fields[6] as MedicinePresentation,
      dosisUnit: fields[7] as MedicineDosisUnit,
      dosis: fields[8] as double,
      interval: fields[9] as int?,
      days: (fields[10] as List?)?.cast<MedicineDay>(),
      hours: (fields[11] as List?)?.cast<TimeOfDay>(),
      instructions: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Medicine obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.startDate)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.stock)
      ..writeByte(5)
      ..write(obj.stockWarning)
      ..writeByte(6)
      ..write(obj.presentation)
      ..writeByte(7)
      ..write(obj.dosisUnit)
      ..writeByte(8)
      ..write(obj.dosis)
      ..writeByte(9)
      ..write(obj.interval)
      ..writeByte(10)
      ..write(obj.days)
      ..writeByte(11)
      ..write(obj.hours)
      ..writeByte(12)
      ..write(obj.instructions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      days: const ListMedicineDayOrNullConverter()
          .fromJson(json['days'] as List?),
      hours:
          const ListTimeOfDayOrNullConverter().fromJson(json['hours'] as List?),
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
      'days': const ListMedicineDayOrNullConverter().toJson(instance.days),
      'hours': const ListTimeOfDayOrNullConverter().toJson(instance.hours),
      'instructions': instance.instructions,
    };

const _$MedicinePresentationEnumMap = {
  MedicinePresentation.capsule: 'capsule',
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
