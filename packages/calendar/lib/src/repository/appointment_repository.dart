import 'package:calendar/calendar.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// {@template measurement_repository}
/// Repository for appointment operations.
/// {@endtemplate}
class AppointmentRepository {
  /// {@macro measurement_repository}
  AppointmentRepository({required AppointmentApi api}) : _api = api;

  final AppointmentApi _api;

  /// Adds a [Appointment] to the calendar.
  ///
  /// Returns a [AppointmentFailure] if the request fails.
  Future<Either<AppointmentFailure, Unit>> addAppointment(
      Appointment appointment) async {
    try {
      await _api.createAppointment(AppointmentDto.fromDomain(appointment));
      return right(unit);
    } on AppointmentDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const AppointmentFailure.sendTimeout());
        case DioErrorType.response:
          return left(const AppointmentFailure.response());
        case DioErrorType.cancel:
          return left(const AppointmentFailure.cancel());
        case DioErrorType.other:
          return left(const AppointmentFailure.unknown());
      }
    }
  }

  /// Deletes a [Appointment] from the calendar.
  ///
  /// Returns a [AppointmentFailure] if the request fails.
  Future<Either<AppointmentFailure, Unit>> deleteAppointment(
      Appointment appointment) async {
    try {
      await _api.deleteAppointment(AppointmentDto.fromDomain(appointment));
      return right(unit);
    } on AppointmentDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const AppointmentFailure.sendTimeout());
        case DioErrorType.response:
          return left(const AppointmentFailure.response());
        case DioErrorType.cancel:
          return left(const AppointmentFailure.cancel());
        case DioErrorType.other:
          return left(const AppointmentFailure.unknown());
      }
    }
  }

  /// Updates a [Appointment] in the calendar.
  ///
  /// Returns a [AppointmentFailure] if the request fails.
  Future<Either<AppointmentFailure, Unit>> updateAppointment(
      Appointment appointment) async {
    try {
      await _api.updateAppointment(AppointmentDto.fromDomain(appointment));
      return right(unit);
    } on AppointmentDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const AppointmentFailure.sendTimeout());
        case DioErrorType.response:
          return left(const AppointmentFailure.response());
        case DioErrorType.cancel:
          return left(const AppointmentFailure.cancel());
        case DioErrorType.other:
          return left(const AppointmentFailure.unknown());
      }
    }
  }
}
