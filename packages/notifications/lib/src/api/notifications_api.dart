import 'package:dio/dio.dart';
import 'package:notifications/notifications.dart';

class NotificationsApi {
  const NotificationsApi(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<List<String>> fetchAll() async {
    late final Response<List<dynamic>> res;

    try {
      res = await _dio.get<List<dynamic>>(notificationsPath);
    } on DioError catch (e) {
      throw NotificationException.fromDioError(e);
    }

    try {
      return res.data!.map((dynamic e) => e as String).toList();
    } catch (e) {
      throw NotificationSerializationException();
    }
  }

  Future<NotificationPreference> add(
    String notificationPrefence,
  ) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        notificationsPath,
        queryParameters: {'notification_preference': notificationPrefence},
      );

      try {
        return NotificationPreference.fromJson(<String, dynamic>{
          'preferences': res.data,
        });
      } catch (_) {
        throw NotificationSerializationException();
      }
    } on DioError catch (e) {
      throw NotificationException.fromDioError(e);
    }
  }

  Future<NotificationPreference> delete(
    String notificationPrefence,
  ) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.delete(
        notificationsPath,
        queryParameters: {'notification_preference': notificationPrefence},
      );

      if (res.statusCode == 401) {
        throw NotificationNotFoundException();
      }

      try {
        return NotificationPreference.fromJson(<String, dynamic>{
          'preferences': res.data,
        });
      } catch (_) {
        throw NotificationSerializationException();
      }
    } on DioError catch (e) {
      throw NotificationException.fromDioError(e);
    }
  }
}
