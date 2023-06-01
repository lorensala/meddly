import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_launch_image');

    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotificationService.initialize(
      initializationSettings,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    const androidNotificationDetails = AndroidNotificationDetails(
      '__meddly_notification_channel_id__',
      'meddly_notification_channel_name',
      channelDescription: 'meddly_description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const iOSNotificationDetails = DarwinNotificationDetails();

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final notificationDetails = await _notificationDetails();

    await _localNotificationService.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  Future<void> showScheduledNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required DateTime scheduledDate,
  }) async {
    final notificationDetails = await _notificationDetails();

    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      notificationDetails,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
