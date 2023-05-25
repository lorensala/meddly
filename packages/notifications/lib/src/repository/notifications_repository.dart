import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:notifications/notifications.dart';
import 'package:rxdart/rxdart.dart';

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
  Stream<Either<NotificationFailure, List<NotificationPreference>>>
      get notificationPreferences {
    return _cache.notificationPreferences
        .map<Either<NotificationFailure, List<NotificationPreference>>>(
      (notificationPreferenceDto) {
        return Right(notificationPreferenceDto.toDomain());
      },
    ).onErrorReturnWith((error, _) {
      if (error is NotificationCacheException) {
        return const Left(NotificationFailure.cache());
      } else {
        return const Left(NotificationFailure.unknown());
      }
    });
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
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const NotificationFailure.sendTimeout());
        case DioErrorType.badResponse:
          return left(const NotificationFailure.response());
        case DioErrorType.cancel:
          return left(const NotificationFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const NotificationFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          switch (e.error.response?.data['detail']['code'] as int) {
            case 500:
              return left(const NotificationFailure.notFound());
            case 501:
              return left(const NotificationFailure.alreadyExists());
            case 502:
              return left(const NotificationFailure.doesNotExist());
            default:
              return left(const NotificationFailure.response());
          }
        case DioErrorType.connectionError:
          return left(const NotificationFailure.connectionTimeOut());
        case DioErrorType.unknown:
          return left(const NotificationFailure.unknown());
      }
    }
  }

  /// Adds a [NotificationPreference].
  ///
  /// Returns a [Unit] if the operation was successful.\
  /// Throws a [NotificationFailure] if the operation was not successful.
  Future<Either<NotificationFailure, Unit>> add(
    NotificationPreference notificationPreference,
  ) async {
    try {
      final notificationPreferenceDto = NotificationPreferenceDto(
        preferences: [notificationPreference.name],
      );
      await _api.add(notificationPreferenceDto);

      await _cache.add(notificationPreferenceDto);
      return right(unit);
    } on NotificationCacheException {
      return left(const NotificationFailure.cache());
    } on NotificationNotFoundException {
      return left(const NotificationFailure.notFound());
    } on NotificationSerializationException {
      return left(const NotificationFailure.serialization());
    } on NotificationDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const NotificationFailure.sendTimeout());
        case DioErrorType.badResponse:
          return left(const NotificationFailure.response());
        case DioErrorType.cancel:
          return left(const NotificationFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const NotificationFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          switch (e.error.response?.data['detail']['code'] as int) {
            case 500:
              return left(const NotificationFailure.notFound());
            case 501:
              return left(const NotificationFailure.alreadyExists());
            case 502:
              return left(const NotificationFailure.doesNotExist());
            default:
              return left(const NotificationFailure.response());
          }
        case DioErrorType.connectionError:
          return left(const NotificationFailure.connectionTimeOut());
        case DioErrorType.unknown:
          return left(const NotificationFailure.unknown());
      }
    }
  }

  /// Delete a [NotificationPreference].
  ///
  /// Returns a [Unit] if the operation was successful.\
  /// Throws a [NotificationFailure] if the operation was not successful.
  Future<Either<NotificationFailure, Unit>> delete(
    NotificationPreference notificationPreference,
  ) async {
    try {
      final notificationPreferenceDto = NotificationPreferenceDto(
        preferences: [notificationPreference.name],
      );
      await _api.delete(notificationPreferenceDto);

      await _cache.remove(notificationPreferenceDto);
      return right(unit);
    } on NotificationCacheException {
      return left(const NotificationFailure.cache());
    } on NotificationNotFoundException {
      return left(const NotificationFailure.notFound());
    } on NotificationSerializationException {
      return left(const NotificationFailure.serialization());
    } on NotificationDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const NotificationFailure.sendTimeout());
        case DioErrorType.badResponse:
          return left(const NotificationFailure.response());
        case DioErrorType.cancel:
          return left(const NotificationFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const NotificationFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          switch (e.error.response?.data['detail']['code'] as int) {
            case 500:
              return left(const NotificationFailure.notFound());
            case 501:
              return left(const NotificationFailure.alreadyExists());
            case 502:
              return left(const NotificationFailure.doesNotExist());
            default:
              return left(const NotificationFailure.response());
          }
        case DioErrorType.connectionError:
          return left(const NotificationFailure.connectionTimeOut());
        case DioErrorType.unknown:
          return left(const NotificationFailure.unknown());
      }
    }
  }
}
