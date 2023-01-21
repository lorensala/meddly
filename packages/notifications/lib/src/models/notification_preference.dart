/// {@template notification_preference}
/// Represents the notification preference of a user.
/// {@endtemplate}
enum NotificationPreference {
  /// {@macro notification_preference}
  sms(isActive: false),

  /// {@macro notification_preference}
  email(isActive: false),

  /// {@macro notification_preference}
  whastapp(isActive: false);

  //// {@macro notification_preference}
  const NotificationPreference({required this.isActive});

  /// if the notification preference is active or not.
  final bool isActive;
}
