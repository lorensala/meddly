// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_dto.dart';

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
