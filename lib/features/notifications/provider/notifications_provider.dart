import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/provider/provider.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_provider.g.dart';

@riverpod
NotificationsCache notificationsCache(NotificationsCacheRef ref) {
  return NotificationsCache(ref.read(notificationPreferencesBoxProvider));
}

@Riverpod(dependencies: [])
NotificationPreference notificationPreference(NotificationPreferenceRef ref) {
  throw UnimplementedError();
}

@riverpod
NotificationsApi notificationsApi(NotificationsApiRef ref) {
  return NotificationsApi(ref.read(dioProvider));
}

@riverpod
NotificationsRepository notificationsRepository(
  NotificationsRepositoryRef ref,
) {
  return NotificationsRepository(
    api: ref.read(notificationsApiProvider),
    cache: ref.read(notificationsCacheProvider),
  );
}

@Riverpod(keepAlive: true, dependencies: [])
LocalNotificationService localNotificationService(
  LocalNotificationServiceRef ref,
) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true, dependencies: [])
FirebaseMessagingService firebaseMessagingService(
    FirebaseMessagingServiceRef ref) {
  throw UnimplementedError();
}
