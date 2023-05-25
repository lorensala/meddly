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
    @Default([]) List<String> preferences,
  }) = _NotificationPrefenceDto;

  /// Converts the [NotificationPreference] to a [NotificationPreferenceDto]
  factory NotificationPreferenceDto.fromDomain(
    List<NotificationPreference> preference,
  ) {
    return NotificationPreferenceDto(
      preferences: preference.map((e) => e.name).toList(),
    );
  }

  /// {@macro notification_preference_dto}
  factory NotificationPreferenceDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferenceDtoFromJson(json);

  const NotificationPreferenceDto._();

  /// Converts the [NotificationPreferenceDto] to a [NotificationPreference]
  List<NotificationPreference> toDomain() {
    return preferences
        .map(
          (e) => NotificationPreference.values.firstWhere((p) => p.name == e),
        )
        .toList();
  }
}
