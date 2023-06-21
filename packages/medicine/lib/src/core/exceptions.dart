import 'dart:io';

import 'package:dio/dio.dart';

sealed class MedicineException implements Exception {
  const MedicineException();

  factory MedicineException.fromDioError(DioError error) {
    if (error.error is SocketException) {
      return const MedicineConnectionException();
    }

    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return const MedicineConnectionException();
      case DioErrorType.connectionTimeout:
        return const MedicineConnectionException();
      case DioErrorType.badResponse:
        final response = error.response;
        if (response == null) {
          return const MedicineUnknownException();
        }
        // ignore: avoid_dynamic_calls
        final errorCode = response.data['detail']['code'] as int?;

        switch (errorCode) {
          case 300:
          case 301:
          case 302:
          case 303:
          case 304:
            return const MedicineInvalidException();
          case 305:
            return const MedicineNotFoundException();
          case 306:
            return const MedicineNotYoursException();
          default:
            return const MedicineUnknownException();
        }
      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return const MedicineUnknownException();
    }
  }
}

class MedicineUnknownException extends MedicineException {
  const MedicineUnknownException();
}

class MedicineNotFoundException extends MedicineException {
  const MedicineNotFoundException();
}

class MedicineNotYoursException extends MedicineException {
  const MedicineNotYoursException();
}

class MedicineConnectionException extends MedicineException {
  const MedicineConnectionException();
}

class MedicineCancelException extends MedicineException {
  const MedicineCancelException();
}

class MedicineSerializationException extends MedicineException {
  const MedicineSerializationException();
}

class MedicineInvalidException extends MedicineException {
  const MedicineInvalidException();
}

class MedicineModelConversionException extends MedicineException {
  const MedicineModelConversionException();
}

class MedicineCacheException extends MedicineException {
  const MedicineCacheException();
}
