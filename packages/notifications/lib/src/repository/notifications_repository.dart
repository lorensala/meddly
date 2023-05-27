import 'package:notifications/notifications.dart';

class NotificationsRepository {
  NotificationsRepository({
    required NotificationsApi api,
    required NotificationsCache cache,
  })  : _api = api,
        _cache = cache;

  final NotificationsApi _api;
  final NotificationsCache _cache;

  Stream<List<NotificationPreference>> get notificationPreferences =>
      _cache.notificationPreferences.map(
        (event) => event
            .map((e) => NotificationPreference(name: e, isActive: true))
            .toList(),
      );

  Future<(NotificationException?, List<NotificationPreference>)>
      fetchAll() async {
    try {
      final preferences = await _api.fetchAll();
      await _cache.addAll(preferences);
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

      await _cache.add(notificationPreference.name);
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

      await _cache.remove(notificationPreference.name);
      return (null, null);
    } on NotificationException catch (e) {
      return (e, null);
    } catch (_) {
      return (NotificationUnknownException(), null);
    }
  }
}
