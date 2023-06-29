import 'dart:io';

import 'package:dio/dio.dart';

sealed class CalendarException implements Exception {
  const CalendarException();

  factory CalendarException.fromDioError(DioError error) {
    if (error.error is SocketException) {
      return const CalendarConnectionException();
    }
    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return const CalendarConnectionException();
      case DioErrorType.connectionTimeout:
        return const CalendarConnectionException();
      case DioErrorType.badResponse:
        final response = error.response;
        if (response == null) {
          return const CalendarUnknownException();
        }
        // ignore: avoid_dynamic_calls
        final errorCode = response.data['detail']['code'] as int?;

        switch (errorCode) {
          case 306:
            return const CalendarAlreadyConsumedException();
          case 307:
            return const CalendarConsumptionDoesNotExistException();
          default:
            return const CalendarUnknownException();
        }

      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return const CalendarUnknownException();
    }
  }
}

final class CalendarUnknownException extends CalendarException {
  const CalendarUnknownException();
}

final class CalendarNotFoundException extends CalendarException {
  const CalendarNotFoundException();
}

final class CalendarSerializationException extends CalendarException {
  const CalendarSerializationException();
}

final class CalendarConnectionException extends CalendarException {
  const CalendarConnectionException();
}

final class CalendarAlreadyConsumedException extends CalendarException {
  const CalendarAlreadyConsumedException();
}

final class CalendarConsumptionDoesNotExistException extends CalendarException {
  const CalendarConsumptionDoesNotExistException();
}
