import 'package:hive/hive.dart';
import 'package:notifications/src/core/core.dart';
import 'package:notifications/src/dto/notification_preference_dto.dart';
import 'package:rxdart/rxdart.dart';

/// {@template notification_cache}
/// Cache for notification preferences.
/// {@endtemplate}
class NotificationsCache {
  /// {@macro notification_cache}
  NotificationsCache(this._box);

  final Box<List<String>> _box;

  /// Stream of [NotificationPreferenceDto]s.
  Stream<NotificationPreferenceDto> get notificationPreferences {
    try {
      return _box
          .watch(key: preferencesBoxKey)
          .map(
            (BoxEvent event) => event.value as List<String>?,
          )
          .map((preferences) {
        if (preferences == null) {
          return const NotificationPreferenceDto(preferences: []);
        } else {
          return NotificationPreferenceDto(preferences: preferences);
        }
      }).startWith(read());
    } catch (e) {
      return Stream.error(e);
    }
  }

  /// Adds a notification preference.
  ///
  /// Throws a [NotificationCacheException] if any error occurs.
  Future<void> write(
    NotificationPreferenceDto notificationPreferenceDto,
  ) async {
    try {
      await _box.put(
        preferencesBoxKey,
        notificationPreferenceDto.preferences,
      );
    } catch (e) {
      throw NotificationCacheException();
    }
  }

  /// Reads all the notification preferences.
  ///
  /// Throws a [NotificationCacheException] if any error occurs.
  NotificationPreferenceDto read() {
    try {
      final preferences = _box.get(preferencesBoxKey) ?? <String>[];

      return NotificationPreferenceDto(preferences: preferences);
    } catch (e) {
      throw NotificationCacheException();
    }
  }

  /// Adds a notification preference.
  ///
  /// Throws a [NotificationCacheException] if any error occurs.
  Future<void> add(
    NotificationPreferenceDto notificationPreferenceDto,
  ) async {
    try {
      final preferences = _box.get(preferencesBoxKey) ?? <String>[];

      await _box.put(
        preferencesBoxKey,
        [...preferences, notificationPreferenceDto.preferences.first],
      );
    } catch (e) {
      throw NotificationCacheException();
    }
  }

  /// Removes a notification preference.
  ///
  /// Throws a [NotificationCacheException] if any error occurs.
  Future<void> remove(
    NotificationPreferenceDto notificationPreferenceDto,
  ) async {
    try {
      final preferences = _box.get(preferencesBoxKey) ?? <String>[];

      await _box.put(
        preferencesBoxKey,
        preferences
            .where(
              (preference) =>
                  preference != notificationPreferenceDto.preferences.first,
            )
            .toList(),
      );
    } catch (e) {
      throw NotificationCacheException();
    }
  }

  /// Clears a notification preference.
  ///
  /// Throws a [NotificationCacheException] if any error occurs.
  Future<void> clear(
    NotificationPreferenceDto notificationPreferenceDto,
  ) async {
    try {
      await _box.delete(preferencesBoxKey);
    } catch (e) {
      throw NotificationCacheException();
    }
  }
}
