import 'package:hive/hive.dart';
import 'package:notifications/src/core/core.dart';
import 'package:notifications/src/models/notification_preference.dart';
import 'package:rxdart/rxdart.dart';

class NotificationsCache {
  NotificationsCache(this._box);

  final Box<List<String>> _box;

  Stream<List<String>> get notificationPreferences {
    try {
      return _box
          .watch(key: preferencesBoxKey)
          .map(
            (BoxEvent event) => event.value as List<String>?,
          )
          .map((preferences) {
        if (preferences == null) {
          return <String>[];
        } else {
          return preferences;
        }
      }).startWith(read());
    } catch (e) {
      return Stream.error(e);
    }
  }

  List<String> read() {
    try {
      final preferences = _box.get(preferencesBoxKey) ?? <String>[];

      return preferences;
    } catch (e) {
      throw NotificationCacheException();
    }
  }

  Future<void> addAll(
    List<String> notificationPreferences,
  ) async {
    try {
      await _box.put(preferencesBoxKey, notificationPreferences);
    } catch (e) {
      throw NotificationCacheException();
    }
  }

  Future<void> add(
    String notificationPreference,
  ) async {
    try {
      final preferences = _box.get(preferencesBoxKey) ?? <String>[];

      await _box.put(
        preferencesBoxKey,
        [...preferences, notificationPreference],
      );
    } catch (e) {
      throw NotificationCacheException();
    }
  }

  Future<void> remove(
    String notificationPreference,
  ) async {
    try {
      final preferences = _box.get(preferencesBoxKey) ?? <String>[];

      await _box.put(
        preferencesBoxKey,
        preferences
            .where(
              (preference) => preference != notificationPreference,
            )
            .toList(),
      );
    } catch (e) {
      throw NotificationCacheException();
    }
  }

  Future<void> clear(
    NotificationPreference NotificationPreference,
  ) async {
    try {
      await _box.delete(preferencesBoxKey);
    } catch (e) {
      throw NotificationCacheException();
    }
  }
}
