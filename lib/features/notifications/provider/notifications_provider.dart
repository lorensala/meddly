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
List<Notification> filteredNotifications(FilteredNotificationsRef ref) {
  final selectedFilters = ref.watch(notificationSelectedFiltersProvider);
  final selectedTypes = ref.watch(notificationSelectedTypesProvider);

  return ref.watch(notificationsControllerProvider).maybeWhen(
        orElse: () => [],
        data: (notifications) {
          final filteredByTypeNotifications = notifications
              .where(
                (notification) => selectedTypes.contains(notification.type),
              )
              .toList();

          final filteredNotifications =
              filteredByTypeNotifications.where((notification) {
            if (selectedFilters.length == 2) return true;
            if (selectedFilters.contains(NotificationFilter.read) &&
                notification.isRead) return true;
            if (selectedFilters.contains(NotificationFilter.notRead) &&
                !notification.isRead) return true;
            return false;
          }).toList();

          return filteredNotifications;
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
  FirebaseMessagingServiceRef ref,
) {
  throw UnimplementedError();
}
