// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentDtoAdapter extends TypeAdapter<AppointmentDto> {
  @override
  final int typeId = 6;

  @override
  AppointmentDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentDto(
      date: fields[0] as String,
      name: fields[1] as String,
      doctor: fields[2] as String?,
      speciality: fields[3] as String?,
      location: fields[4] as String?,
      notes: fields[5] as String?,
      id: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentDto obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.doctor)
      ..writeByte(3)
      ..write(obj.speciality)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.notes)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentDto _$$_AppointmentDtoFromJson(Map<String, dynamic> json) =>
    _$_AppointmentDto(
      date: json['date'] as String,
      name: json['name'] as String,
      doctor: json['doctor'] as String?,
      speciality: json['speciality'] as String?,
      location: json['location'] as String?,
      notes: json['notes'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_AppointmentDtoToJson(_$_AppointmentDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'name': instance.name,
      'doctor': instance.doctor,
      'speciality': instance.speciality,
      'location': instance.location,
      'notes': instance.notes,
      'id': instance.id,
    };
