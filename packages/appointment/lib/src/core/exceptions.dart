import 'package:dio/dio.dart';

sealed class AppointmentException implements Exception {
  const AppointmentException();

  factory AppointmentException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return const AppointmentConnectionException();
      case DioErrorType.connectionTimeout:
        return const AppointmentConnectionException();
      case DioErrorType.badResponse:
        final response = error.response;
        if (response == null) {
          return const AppointmentUnknownException();
        }
        // ignore: avoid_dynamic_calls
        final errorCode = response.data['detail']['code'] as int?;

        switch (errorCode) {
          case 400:
            return const AppointmentNotFoundException();
          case 401:
            return const AppointmentNotYoursException();
          default:
            return const AppointmentUnknownException();
        }
      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return const AppointmentUnknownException();
    }
  }
}

class AppointmentUnknownException extends AppointmentException {
  const AppointmentUnknownException();
}

class AppointmentNotFoundException extends AppointmentException {
  const AppointmentNotFoundException();
}

class AppointmentSerializationException extends AppointmentException {
  const AppointmentSerializationException();
}

class AppointmentConnectionException extends AppointmentException {
  const AppointmentConnectionException();
}

class AppointmentNotYoursException extends AppointmentException {
  const AppointmentNotYoursException();
}

class AppointmentCancelException extends AppointmentException {
  const AppointmentCancelException();
}

class AppointmentModelConversionException extends AppointmentException {
  const AppointmentModelConversionException();
}
