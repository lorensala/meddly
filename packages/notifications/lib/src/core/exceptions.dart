import 'dart:io';

import 'package:dio/dio.dart';

sealed class NotificationException implements Exception {
  const NotificationException();

  factory NotificationException.fromDioError(DioError error) {
    if (error.error is SocketException) {
      return const NotificationConnectionException();
    }

    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return const NotificationConnectionException();
      case DioErrorType.connectionTimeout:
        return const NotificationConnectionException();
      case DioErrorType.badResponse:
        final response = error.response;
        if (response == null) {
          return const NotificationUnknownException();
        }
        // ignore: avoid_dynamic_calls
        final errorCode = response.data['detail']['code'] as int?;

        switch (errorCode) {
          case 500:
            return const NotificationNotFoundException();
          case 501:
            return const NotificationAlreadyExistsException();
          case 502:
            return const NotificationDontExistsException();
          default:
            return const NotificationUnknownException();
        }
      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return const NotificationUnknownException();
    }
  }
}

class NotificationNotFoundException extends NotificationException {
  const NotificationNotFoundException();
}

class NotificationSerializationException extends NotificationException {
  const NotificationSerializationException();
}

class NotificationCacheException extends NotificationException {
  const NotificationCacheException();
}

class NotificationAlreadyExistsException extends NotificationException {
  const NotificationAlreadyExistsException();
}

class NotificationDontExistsException extends NotificationException {
  const NotificationDontExistsException();
}

class NotificationConnectionException extends NotificationException {
  const NotificationConnectionException();
}

class NotificationUnknownException extends NotificationException {
  const NotificationUnknownException();
}
