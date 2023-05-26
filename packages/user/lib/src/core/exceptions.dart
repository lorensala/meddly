import 'package:dio/dio.dart';

sealed class UserException implements Exception {
  const UserException();

  factory UserException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return const UserConnectionException();
      case DioErrorType.connectionTimeout:
        return const UserConnectionException();
      case DioErrorType.badResponse:
        return const UserUnknownException();
      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return const UserUnknownException();
    }
  }
}

class UserUnknownException extends UserException {
  const UserUnknownException();
}

class UserNotFoundException extends UserException {
  const UserNotFoundException();
}

class UserSerializationException extends UserException {
  const UserSerializationException();
}

class UserConnectionException extends UserException {
  const UserConnectionException();
}

class UserNotYoursException extends UserException {
  const UserNotYoursException();
}

class UserCacheException extends UserException {
  const UserCacheException();
}

class UserModelConversionException extends UserException {
  const UserModelConversionException();
}
