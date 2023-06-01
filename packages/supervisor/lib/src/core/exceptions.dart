import 'package:dio/dio.dart';

sealed class SupervisorException implements Exception {
  const SupervisorException();

  factory SupervisorException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionError:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectionTimeout:
        return const SupervisorConnectionException();
      case DioErrorType.badResponse:
        final response = error.response;
        if (response == null) {
          return const SupervisorUnknownException();
        }
        // ignore: avoid_dynamic_calls
        final errorCode = response.data['detail']['code'] as int?;

        switch (errorCode) {
          case 200:
            return const SupervisorIsAlreadyYoutSupervisorException();
          case 201:
            return const SupervisorInvalidInvitationCodeException();
          case 202:
            return const SupervisorNotFoundException();
          case 203:
            return const SupervisedNotFoundException();
          case 204:
            return const SupervisorCantSuperviseYourselfException();
          default:
            return const SupervisorUnknownException();
        }
      case DioErrorType.badCertificate:
      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return const SupervisorUnknownException();
    }
  }
}

final class SupervisorConnectionException extends SupervisorException {
  const SupervisorConnectionException();
}

final class SupervisorSerializationException extends SupervisorException {
  const SupervisorSerializationException();
}

final class SupervisorUnknownException extends SupervisorException {
  const SupervisorUnknownException();
}

final class SupervisorIsAlreadyYoutSupervisorException
    extends SupervisorException {
  const SupervisorIsAlreadyYoutSupervisorException();
}

final class SupervisorInvalidInvitationCodeException
    extends SupervisorException {
  const SupervisorInvalidInvitationCodeException();
}

final class SupervisorNotFoundException extends SupervisorException {
  const SupervisorNotFoundException();
}

final class SupervisedNotFoundException extends SupervisorException {
  const SupervisedNotFoundException();
}

final class SupervisorCantSuperviseYourselfException
    extends SupervisorException {
  const SupervisorCantSuperviseYourselfException();
}
