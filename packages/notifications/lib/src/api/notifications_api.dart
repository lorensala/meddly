import 'package:dio/dio.dart';
import 'package:notifications/src/core/core.dart';
import 'package:notifications/src/dto/notification_preference_dto.dart';

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
  Future<List<NotificationPreferenceDto>> fetchAll() async {
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
      return res.data!
          .map(
            (e) =>
                NotificationPreferenceDto.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } catch (_) {
      throw NotificationSerializationException();
    }
  }

  /// Adds a notification preference.
  ///
  /// Throws a [NotificationNotFoundException] if the user is not found.\
  /// Throws a [NotificationDioException] if any other DioError occurs.
  Future<void> add(NotificationPreferenceDto notificationPrefenceDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        notificationsPath,
        data: notificationPrefenceDto.toJson(),
      );

      if (res.statusCode == 401) {
        throw NotificationNotFoundException();
      }
    } on DioError catch (e) {
      throw NotificationDioException(e);
    }
  }

  /// Deletes a notification preference.
  ///
  /// Throws a [NotificationNotFoundException] if the user is not found.\
  /// Throws a [NotificationDioException] if any other DioError occurs.
  Future<void> delete(String preference) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.delete(
        notificationsPath,
        data: {'preference': preference},
      );

      if (res.statusCode == 401) {
        throw NotificationNotFoundException();
      }
    } on DioError catch (e) {
      throw NotificationDioException(e);
    }
  }
}
