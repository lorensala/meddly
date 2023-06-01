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

  Future<void> add(
    String notificationPrefence,
  ) async {
    try {
      await _dio.post<dynamic>(
        notificationsPath,
        queryParameters: {'notification_preference': notificationPrefence},
      );
    } on DioError catch (e) {
      throw NotificationException.fromDioError(e);
    }
  }

  Future<void> delete(
    String notificationPrefence,
  ) async {
    try {
      await _dio.delete<dynamic>(
        notificationsPath,
        queryParameters: {'notification_preference': notificationPrefence},
      );
    } on DioError catch (e) {
      throw NotificationException.fromDioError(e);
    }
  }
}
