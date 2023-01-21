import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notifications/src/models/models.dart';

part 'notification_preference_dto.freezed.dart';
part 'notification_preference_dto.g.dart';

/// {@template notification_preference_dto}
/// Data transfer object for notification prefence
/// {@endtemplate}
@freezed
class NotificationPreferenceDto with _$NotificationPreferenceDto {
  /// {@macro notification_preference_dto}
  const factory NotificationPreferenceDto({
    required String preference,
  }) = _NotificationPrefenceDto;

  /// {@macro notification_preference_dto}
  factory NotificationPreferenceDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferenceDtoFromJson(json);

  const NotificationPreferenceDto._();

  /// Converts the [NotificationPreferenceDto] to a [NotificationPreference]
  NotificationPreference toDomain() {
    return NotificationPreference.values.firstWhere(
      (element) => element.toString() == 'NotificationPreference.$preference',
    );
  }
}
