// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preference_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationPrefenceDto _$$_NotificationPrefenceDtoFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationPrefenceDto(
      preferences: (json['preferences'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_NotificationPrefenceDtoToJson(
        _$_NotificationPrefenceDto instance) =>
    <String, dynamic>{
      'preferences': instance.preferences,
    };
