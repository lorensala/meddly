import 'package:dio/dio.dart';

sealed class MeasurementException implements Exception {
  const MeasurementException();

  factory MeasurementException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return const MeasurementConnectionException();
      case DioErrorType.connectionTimeout:
        return const MeasurementConnectionException();
      case DioErrorType.badResponse:
        final response = error.response;
        if (response == null) {
          return const MeasurementUnknownException();
        }
        // ignore: avoid_dynamic_calls
        final errorCode = response.data['detail']['code'] as int?;

        switch (errorCode) {
          case 600:
            return const MeasurementNotFoundException();
          case 601:
            return const MeasurementNotYoursException();
          default:
            return const MeasurementUnknownException();
        }
      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return const MeasurementUnknownException();
    }
  }
}

class MeasurementUnknownException extends MeasurementException {
  const MeasurementUnknownException();
}

class MeasurementNotFoundException extends MeasurementException {
  const MeasurementNotFoundException();
}

class MeasurementNotYoursException extends MeasurementException {
  const MeasurementNotYoursException();
}

class MeasurementConnectionException extends MeasurementException {
  const MeasurementConnectionException();
}

class MeasurementCancelException extends MeasurementException {
  const MeasurementCancelException();
}

class MeasurementSerializationException extends MeasurementException {
  const MeasurementSerializationException();
}
