// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Appointment _$$_AppointmentFromJson(Map<String, dynamic> json) =>
    _$_Appointment(
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
      id: json['id'] as int?,
      doctor: json['doctor'] as String?,
      speciality: $enumDecodeNullable(
        _$AppointmentSpecialityEnumMap,
        json['speciality'],
      ),
      location: json['location'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$_AppointmentToJson(_$_Appointment instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'name': instance.name,
      'id': instance.id,
      'doctor': instance.doctor,
      'speciality': _$AppointmentSpecialityEnumMap[instance.speciality],
      'location': instance.location,
      'notes': instance.notes,
    };

const _$AppointmentSpecialityEnumMap = {
  AppointmentSpeciality.urology: 'urology',
  AppointmentSpeciality.gynecology: 'gynecology',
  AppointmentSpeciality.cardiology: 'cardiology',
  AppointmentSpeciality.dermatology: 'dermatology',
  AppointmentSpeciality.neurology: 'neurology',
  AppointmentSpeciality.orthopedics: 'orthopedics',
  AppointmentSpeciality.pediatrics: 'pediatrics',
  AppointmentSpeciality.pulmonology: 'pulmonology',
  AppointmentSpeciality.radiology: 'radiology',
  AppointmentSpeciality.surgery: 'surgery',
  AppointmentSpeciality.ophthalmology: 'ophthalmology',
  AppointmentSpeciality.gastroenterology: 'gastroenterology',
  AppointmentSpeciality.endocrinology: 'endocrinology',
  AppointmentSpeciality.nephrology: 'nephrology',
  AppointmentSpeciality.oncology: 'oncology',
  AppointmentSpeciality.psychiatry: 'psychiatry',
  AppointmentSpeciality.rheumatology: 'rheumatology',
  AppointmentSpeciality.otolaryngology: 'otolaryngology',
  AppointmentSpeciality.hematology: 'hematology',
  AppointmentSpeciality.other: 'other',
};
