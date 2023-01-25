part of 'notifications_bloc.dart';

@freezed
class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.started() = _Started;
  const factory NotificationsEvent.listenNotificationPrefences() =
      _ListenNotificationPrefences;
  const factory NotificationsEvent.addNotificationPreference(
    NotificationPreference notificationPreference,
  ) = _AddNotificationPreference;
  const factory NotificationsEvent.removeNotificationPreference(
    NotificationPreference notificationPreference,
  ) = _RemoveNotificationPreference;
  const factory NotificationsEvent.fetchNotificationPreferences() =
      _FetchNotificationPreferences;
}
