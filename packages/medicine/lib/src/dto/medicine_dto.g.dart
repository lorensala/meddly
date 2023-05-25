// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineDtoAdapter extends TypeAdapter<MedicineDto> {
  @override
  final int typeId = 4;

  @override
  MedicineDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineDto(
      id: fields[0] as int,
      name: fields[1] as String,
      startDate: fields[2] as String,
      endDate: fields[3] as String?,
      stock: fields[4] as int?,
      stockWarning: fields[5] as int?,
      presentation: fields[6] as String,
      dosisUnit: fields[7] as String,
      dosis: fields[8] as double,
      interval: fields[9] as int?,
      days: (fields[10] as List?)?.cast<int>(),
      hours: (fields[11] as List?)?.cast<String>(),
      instructions: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MedicineDto obj) {
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
      other is MedicineDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MedicineDto _$$_MedicineDtoFromJson(Map<String, dynamic> json) =>
    _$_MedicineDto(
      id: json['id'] as int,
      name: json['name'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
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
      'start_date': instance.startDate,
      'end_date': instance.endDate,
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
