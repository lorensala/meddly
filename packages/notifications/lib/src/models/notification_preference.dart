import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_preference.freezed.dart';
part 'notification_preference.g.dart';

@freezed
class NotificationPreference with _$NotificationPreference {
  const factory NotificationPreference({
    required String name,
    @Default(false) isActive,
  }) = _NotificationPreference;

  factory NotificationPreference.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferenceFromJson(json);
}
