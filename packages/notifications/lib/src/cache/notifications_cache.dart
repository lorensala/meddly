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

  final Box<List<NotificationPreferenceDto>> _box;

  /// Stream of [NotificationPreferenceDto]s.
  Stream<List<NotificationPreferenceDto>> get notificationPreferences {
    try {
      return _box.watch(key: preferencesBoxKey).map(
        (event) {
          return event.value == null
              ? <NotificationPreferenceDto>[]
              : event.value as List<NotificationPreferenceDto>;
        },
      ).startWith(read());
    } catch (e) {
      return Stream.error(e);
    }
  }

  /// Adds a notification preference.
  ///
  /// Throws a [NotificationCacheException] if any error occurs.
  Future<void> write(
    List<NotificationPreferenceDto> notificationPreferenceDtoList,
  ) async {
    try {
      await _box.add(notificationPreferenceDtoList);
    } catch (e) {
      throw NotificationCacheException();
    }
  }

  /// Reads all the notification preferences.
  ///
  /// Throws a [NotificationCacheException] if any error occurs.
  List<NotificationPreferenceDto> read() {
    try {
      final preferences = _box.get(preferencesBoxKey, defaultValue: [])!;
      return preferences;
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
      await _box.delete(notificationPreferenceDto.preference);
    } catch (e) {
      throw NotificationCacheException();
    }
  }
}
