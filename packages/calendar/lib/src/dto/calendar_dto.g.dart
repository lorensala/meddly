// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarDtoAdapter extends TypeAdapter<CalendarDto> {
  @override
  final int typeId = 3;

  @override
  CalendarDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarDto(
      activeMedicines: (fields[0] as List).cast<MedicineDto>(),
      appointments: (fields[1] as List).cast<AppointmentDto>(),
      measurements: (fields[2] as List).cast<MeasurementDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, CalendarDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.activeMedicines)
      ..writeByte(1)
      ..write(obj.appointments)
      ..writeByte(2)
      ..write(obj.measurements);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarDto _$$_CalendarDtoFromJson(Map<String, dynamic> json) =>
    _$_CalendarDto(
      activeMedicines: (json['active_medicines'] as List<dynamic>)
          .map((e) => MedicineDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      appointments: (json['appointments'] as List<dynamic>)
          .map((e) => AppointmentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      measurements: (json['measurements'] as List<dynamic>)
          .map((e) => MeasurementDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CalendarDtoToJson(_$_CalendarDto instance) =>
    <String, dynamic>{
      'active_medicines':
          instance.activeMedicines.map((e) => e.toJson()).toList(),
      'appointments': instance.appointments.map((e) => e.toJson()).toList(),
      'measurements': instance.measurements.map((e) => e.toJson()).toList(),
    };
