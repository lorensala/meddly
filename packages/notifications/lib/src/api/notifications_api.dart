import 'package:dio/dio.dart';
import 'package:notifications/notifications.dart';

/// {@template notification_api}
/// API for notification operations.
/// {@endtemplate}
class NotificationsApi {
  /// {@macro notification_api}
  NotificationsApi(Dio dio, {String? baseUrl}) : _dio = dio {
    _dio.options.baseUrl = baseUrl ?? _dio.options.baseUrl;
  }

  final Dio _dio;

  /// Fetches all the notifications.
  ///
  /// Throws a [NotificationNotFoundException] if the user is not found.\
  /// Throws a [NotificationDioException] if any other DioError occurs.
  Future<NotificationPreferenceDto> fetchAll() async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(notificationsPath);

      if (res.statusCode == 401) {
        throw NotificationNotFoundException();
      }
    } on DioError catch (e) {
      throw NotificationDioException(e);
    }

    try {
      return NotificationPreferenceDto.fromJson(<String, dynamic>{
        'preferences': res.data,
      });
    } catch (e) {
      throw NotificationSerializationException();
    }
  }

  /// Adds a notification preference.
  ///
  /// Throws a [NotificationNotFoundException] if the user is not found.\
  /// Throws a [NotificationDioException] if any other DioError occurs.
  Future<NotificationPreferenceDto> add(
    NotificationPreferenceDto notificationPrefenceDto,
  ) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        notificationsPath,
        queryParameters: {
          'notification_preference': notificationPrefenceDto.preferences.first
        },
      );

      if (res.statusCode == 401) {
        throw NotificationNotFoundException();
      }

      try {
        return NotificationPreferenceDto.fromJson(<String, dynamic>{
          'preferences': res.data,
        });
      } catch (_) {
        throw NotificationSerializationException();
      }
    } on DioError catch (e) {
      throw NotificationDioException(e);
    }
  }

  /// Deletes a notification preference.
  ///
  /// Throws a [NotificationNotFoundException] if the user is not found.\
  /// Throws a [NotificationDioException] if any other DioError occurs.
  Future<NotificationPreferenceDto> delete(
    NotificationPreferenceDto notificationPrefenceDto,
  ) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.delete(
        notificationsPath,
        queryParameters: {
          'notification_preference': notificationPrefenceDto.preferences.first
        },
      );

      if (res.statusCode == 401) {
        throw NotificationNotFoundException();
      }

      try {
        return NotificationPreferenceDto.fromJson(<String, dynamic>{
          'preferences': res.data,
        });
      } catch (_) {
        throw NotificationSerializationException();
      }
    } on DioError catch (e) {
      throw NotificationDioException(e);
    }
  }
}
