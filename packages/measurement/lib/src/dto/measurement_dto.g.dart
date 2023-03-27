// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasurementDtoAdapter extends TypeAdapter<MeasurementDto> {
  @override
  final int typeId = 5;

  @override
  MeasurementDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeasurementDto(
      date: fields[0] as String,
      type: fields[1] as String,
      value: fields[2] as double,
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MeasurementDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasurementDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MeasurementDto _$$_MeasurementDtoFromJson(Map<String, dynamic> json) =>
    _$_MeasurementDto(
      date: json['date'] as String,
      type: json['type'] as String,
      value: (json['value'] as num).toDouble(),
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_MeasurementDtoToJson(_$_MeasurementDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'type': instance.type,
      'value': instance.value,
      'id': instance.id,
    };
