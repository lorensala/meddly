import 'package:dio/dio.dart';

sealed class CalendarException implements Exception {
  const CalendarException();

  factory CalendarException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return const CalendarConnectionException();
      case DioErrorType.connectionTimeout:
        return const CalendarConnectionException();
      case DioErrorType.badResponse:
        return const CalendarUnknownException();
      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return const CalendarUnknownException();
    }
  }
}

class CalendarUnknownException extends CalendarException {
  const CalendarUnknownException();
}

class CalendarNotFoundException extends CalendarException {
  const CalendarNotFoundException();
}

class CalendarSerializationException extends CalendarException {
  const CalendarSerializationException();
}

class CalendarConnectionException extends CalendarException {
  const CalendarConnectionException();
}
