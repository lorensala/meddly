import 'package:dio/dio.dart';

sealed class PredictionException implements Exception {
  const PredictionException();

  factory PredictionException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return const PredictionConnectionException();
      case DioErrorType.connectionTimeout:
        return const PredictionConnectionException();
      case DioErrorType.badResponse:
        final response = error.response;
        if (response == null) {
          return const PredictionUnknownException();
        }
        // ignore: avoid_dynamic_calls
        final errorCode = response.data['detail']['code'] as int?;

        switch (errorCode) {
          case 700:
            return const PredictionInvalidException();
          case 701:
            return const PredictionAlreadyVerified();
          case 702:
            return const PredictionNotFoundException();
          default:
            return const PredictionUnknownException();
        }
      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return const PredictionUnknownException();
    }
  }
}

class PredictionUnknownException extends PredictionException {
  const PredictionUnknownException();
}

class PredictionNotFoundException extends PredictionException {
  const PredictionNotFoundException();
}

class PredictionNotYoursException extends PredictionException {
  const PredictionNotYoursException();
}

class PredictionInvalidException extends PredictionException {
  const PredictionInvalidException();
}

class PredictionAlreadyVerified extends PredictionException {
  const PredictionAlreadyVerified();
}

class PredictionConnectionException extends PredictionException {
  const PredictionConnectionException();
}

class PredictionCancelException extends PredictionException {
  const PredictionCancelException();
}

class PredictionSerializationException extends PredictionException {
  const PredictionSerializationException();
}
