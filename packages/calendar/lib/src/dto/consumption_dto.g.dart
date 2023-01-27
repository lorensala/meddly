// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConsumptionDtoAdapter extends TypeAdapter<ConsumptionDto> {
  @override
  final int typeId = 7;

  @override
  ConsumptionDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConsumptionDto(
      date: fields[0] as String,
      realConsumptionDate: fields[1] as String,
      medicineId: fields[2] as int,
      consumed: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ConsumptionDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.realConsumptionDate)
      ..writeByte(2)
      ..write(obj.medicineId)
      ..writeByte(3)
      ..write(obj.consumed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsumptionDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
