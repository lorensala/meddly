// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationPreference _$$_NotificationPreferenceFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationPreference(
      name: json['name'] as String,
      isActive: json['is_active'] ?? false,
    );

Map<String, dynamic> _$$_NotificationPreferenceToJson(
        _$_NotificationPreference instance) =>
    <String, dynamic>{
      'name': instance.name,
      'is_active': instance.isActive,
    };
