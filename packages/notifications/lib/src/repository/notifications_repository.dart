import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:notifications/notifications.dart';

/// {@template notifications_repository}
/// Repository for notification operations.
/// {@endtemplate}
class NotificationsRepository {
  /// {@macro notifications_repository}
  NotificationsRepository({
    required NotificationsApi api,
    required NotificationsCache cache,
  })  : _api = api,
        _cache = cache;

  final NotificationsApi _api;
  final NotificationsCache _cache;

  /// Stream of [NotificationPreference]s.
  ///
  /// Emits a list of [NotificationPreference] when the notifications preferences are updated.\
  /// Emits an empty list when the notifications preferences are cleared.
  Stream<List<NotificationPreference>> get notificationPreferences {
    return _cache.notificationPreferences.map(
      (notificationPreferenceDtoList) {
        return notificationPreferenceDtoList
            .map(
              (notificationPreferenceDto) =>
                  notificationPreferenceDto.toDomain(),
            )
            .toList();
      },
    );
  }

  /// Fetches all the notifications.
  ///
  /// Returns a [Unit] if the operation was successful.\
  /// Throws a [NotificationFailure] if the operation was not successful.
  Future<Either<NotificationFailure, Unit>> fetchAll() async {
    try {
      final notificationPreferenceDtoList = await _api.fetchAll();
      await _cache.write(notificationPreferenceDtoList);
      return right(unit);
    } on NotificationCacheException {
      return left(const NotificationFailure.cache());
    } on NotificationNotFoundException {
      return left(const NotificationFailure.notFound());
    } on NotificationSerializationException {
      return left(const NotificationFailure.serialization());
    } on NotificationDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
          return left(const NotificationFailure.timeout());

        case DioErrorType.sendTimeout:
          return left(const NotificationFailure.sendTimeout());

        case DioErrorType.receiveTimeout:
          return left(const NotificationFailure.receiveTimeout());

        case DioErrorType.response:
          return left(const NotificationFailure.response());

        case DioErrorType.cancel:
          return left(const NotificationFailure.cancel());

        case DioErrorType.other:
          return left(const NotificationFailure.unknown());
      }
    }
  }

  //
}
