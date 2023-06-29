import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/provider/provider.dart';
import 'package:notifications/notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_provider.g.dart';

@Riverpod(dependencies: [])
NotificationPreference notificationPreference(NotificationPreferenceRef ref) {
  throw UnimplementedError();
}

@riverpod
List<Notification> filteredNotifications(FilteredNotificationsRef ref) {
  final selectedTypes = ref.watch(notificationSelectedTypesProvider);

  return ref.watch(notificationsControllerProvider).maybeWhen(
        orElse: () => [],
        data: (notifications) {
          final filteredByTypeNotifications = notifications
              .where(
                (notification) => selectedTypes.contains(notification.type),
              )
              .toList();

          return filteredByTypeNotifications;
        },
      );
}

@riverpod
bool hasUnreadNotifications(HasUnreadNotificationsRef ref) {
  return ref.watch(notificationsControllerProvider).maybeWhen(
        orElse: () => false,
        data: (notifications) {
          return notifications.any((notification) => !notification.isRead);
        },
      );
}

@riverpod
NotificationsApi notificationsApi(NotificationsApiRef ref) {
  return NotificationsApi(ref.read(dioProvider));
}

@Riverpod(dependencies: [])
Notification notification(NotificationRef ref) {
  throw UnimplementedError();
}

@riverpod
NotificationsRepository notificationsRepository(
  NotificationsRepositoryRef ref,
) {
  return NotificationsRepository(
    api: ref.read(notificationsApiProvider),
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
  FirebaseMessagingServiceRef ref,
) {
  throw UnimplementedError();
}
