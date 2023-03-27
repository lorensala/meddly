import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:measurement/src/api/api.dart';
import 'package:measurement/src/core/core.dart';
import 'package:measurement/src/dto/dto.dart';
import 'package:measurement/src/models/models.dart';

/// {@template measurement_repository}
/// Repository for measurement operations.
/// {@endtemplate}
class MeasurementRepository {
  /// {@macro measurement_repository}
  MeasurementRepository({required MeasurementApi api}) : _api = api;

  final MeasurementApi _api;

  /// Adds a [Measurement] to the calendar.
  ///
  /// Returns a [MeasurementFailure] if the [Measurement] fails to add.
  Future<Either<MeasurementFailure, Unit>> addMeasurement(
    Measurement measurement,
  ) async {
    try {
      final dto = MeasurementDto.fromDomain(measurement);
      await _api.createMeasurement(dto);

      return right(unit);
    } on MeasurementDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const MeasurementFailure.sendTimeout());
        case DioErrorType.cancel:
          return left(const MeasurementFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const MeasurementFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          return left(const MeasurementFailure.unknown());
        case DioErrorType.badResponse:
          return left(const MeasurementFailure.response());
        case DioErrorType.connectionError:
          return left(const MeasurementFailure.unknown());
        case DioErrorType.unknown:
          return left(const MeasurementFailure.unknown());
      }
    }
  }

  /// Deletes a [Measurement] to the calendar.
  ///
  /// Returns a [MeasurementFailure] if the [Measurement] fails to add.
  Future<Either<MeasurementFailure, Unit>> deleteMeasurement(
    Measurement measurement,
  ) async {
    try {
      final dto = MeasurementDto.fromDomain(measurement);
      await _api.deleteMeasurement(dto);

      return right(unit);
    } on MeasurementDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const MeasurementFailure.sendTimeout());
        case DioErrorType.cancel:
          return left(const MeasurementFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const MeasurementFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          return left(const MeasurementFailure.unknown());
        case DioErrorType.badResponse:
          return left(const MeasurementFailure.response());
        case DioErrorType.connectionError:
          return left(const MeasurementFailure.unknown());
        case DioErrorType.unknown:
          return left(const MeasurementFailure.unknown());
      }
    }
  }

  /// Updates a [Measurement] to the calendar.
  ///
  /// Returns a [MeasurementFailure] if the [Measurement] fails to add.
  Future<Either<MeasurementFailure, Unit>> updateMeasurement(
    Measurement measurement,
  ) async {
    try {
      final dto = MeasurementDto.fromDomain(measurement);
      await _api.updateMeasurement(dto);

      return right(unit);
    } on MeasurementDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const MeasurementFailure.sendTimeout());
        case DioErrorType.cancel:
          return left(const MeasurementFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const MeasurementFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          return left(const MeasurementFailure.unknown());
        case DioErrorType.badResponse:
          return left(const MeasurementFailure.response());
        case DioErrorType.connectionError:
          return left(const MeasurementFailure.unknown());
        case DioErrorType.unknown:
          return left(const MeasurementFailure.unknown());
      }
    }
  }
}
