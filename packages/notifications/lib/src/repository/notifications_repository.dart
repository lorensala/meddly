import 'package:notifications/notifications.dart';

class NotificationsRepository {
  NotificationsRepository({
    required NotificationsApi api,
  }) : _api = api;

  final NotificationsApi _api;

  Future<(NotificationException?, List<Notification>)> fetchAll() async {
    try {
      final preferences = await _api.fetchAll();
      return (null, preferences);
    } on NotificationException catch (e) {
      return (e, <Notification>[]);
    } catch (_) {
      return (NotificationUnknownException(), <Notification>[]);
    }
  }

  Future<(NotificationException?, List<NotificationPreference>)>
      fetchAllPreferences() async {
    try {
      final preferences = await _api.fetchAllPreferences();
      return (
        null,
        preferences
            .map((e) => NotificationPreference(name: e, isActive: true))
            .toList()
      );
    } on NotificationException catch (e) {
      return (e, <NotificationPreference>[]);
    } catch (_) {
      return (NotificationUnknownException(), <NotificationPreference>[]);
    }
  }

  Future<(NotificationException?, void)> add(
    NotificationPreference notificationPreference,
  ) async {
    try {
      await _api.add(notificationPreference.name);

      return (null, null);
    } on NotificationException catch (e) {
      return (e, null);
    } catch (_) {
      return (NotificationUnknownException(), null);
    }
  }

  Future<(NotificationException?, void)> delete(
    NotificationPreference notificationPreference,
  ) async {
    try {
      await _api.delete(notificationPreference.name);

      return (null, null);
    } on NotificationException catch (e) {
      return (e, null);
    } catch (_) {
      return (NotificationUnknownException(), null);
    }
  }

  //deleteNotification
  Future<(NotificationException?, void)> deleteNotification(
    Notification notification,
  ) async {
    try {
      await _api.deleteNotification(notification.id);

      return (null, null);
    } on NotificationException catch (e) {
      return (e, null);
    } catch (_) {
      return (NotificationUnknownException(), null);
    }
  }
}
