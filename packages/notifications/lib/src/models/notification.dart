import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notifications/notifications.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required int id,
    required String title,
    required String body,
    required DateTime createdAt,
    @Default(NotificationType.supervisors) NotificationType type,
    @Default(false) bool isRead,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
