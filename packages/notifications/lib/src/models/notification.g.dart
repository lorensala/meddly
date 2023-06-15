// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']) ??
          NotificationType.supervisors,
      isRead: json['is_read'] as bool? ?? false,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'created_at': instance.createdAt.toIso8601String(),
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'is_read': instance.isRead,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.supervisors: 'supervisors',
  NotificationType.appointment: 'appointment',
  NotificationType.medicine: 'medicine',
};
