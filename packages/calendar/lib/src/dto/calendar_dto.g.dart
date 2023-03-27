// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalendarDto _$$_CalendarDtoFromJson(Map<String, dynamic> json) =>
    _$_CalendarDto(
      activeMedicines: (json['active_medicines'] as List<dynamic>?)
              ?.map((e) => MedicineDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      appointments: (json['appointments'] as List<dynamic>?)
              ?.map((e) => AppointmentDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      measurements: (json['measurements'] as List<dynamic>?)
              ?.map((e) => MeasurementDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      consumptions: (json['consumptions'] as List<dynamic>?)
              ?.map((e) => ConsumptionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CalendarDtoToJson(_$_CalendarDto instance) =>
    <String, dynamic>{
      'active_medicines':
          instance.activeMedicines.map((e) => e.toJson()).toList(),
      'appointments': instance.appointments.map((e) => e.toJson()).toList(),
      'measurements': instance.measurements.map((e) => e.toJson()).toList(),
      'consumptions': instance.consumptions.map((e) => e.toJson()).toList(),
    };
