import 'package:calendar/calendar.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// {@template measurement_repository}
/// Repository for measurement operations.
/// {@endtemplate}
class MeasurementRepository {
  /// {@macro measurement_repository}
  MeasurementRepository({required MeasurementApi api}) : _api = api;

  final MeasurementApi _api;

  // Future<Either<MeasurementFailure, Unit>> fetchAll() async {
  //   try {
  //     await _api.fetchAll();
  //     return right(unit);
  //   } on MeasurementDioException catch (e) {
  //     return left(MeasurementFailure.fromDioException(e));
  //   } on MeasurementSerializationException {
  //     return left(const MeasurementFailure.serializationError());
  //   }
  // }

  /// Adds a [Measurement] to the calendar.
  ///
  /// Returns a [MeasurementFailure] if the [Measurement] fails to add.
  Future<Either<MeasurementFailure, Unit>> addMeasurement(
    Measurement measurement,
  ) async {
    try {
      final dto = MeasurementDto.fromDomain(measurement);
      await _api.createMeasurement(dto);

      // final calendar = _cache.readCalendar();
      // if (calendar == null) {
      //   await _cache.writeCalendar(
      //     CalendarDto(measurements: [dto]),
      //   );
      // } else {
      //   await _cache.writeCalendar(
      //     calendar.copyWith(measurements: [...calendar.measurements, dto]),
      //   );
      // }

      return right(unit);
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const MeasurementFailure.sendTimeout());
        case DioErrorType.response:
          return left(const MeasurementFailure.response());
        case DioErrorType.cancel:
          return left(const MeasurementFailure.cancel());
        case DioErrorType.other:
          return left(const MeasurementFailure.unknown());
      }
    }
  }
}
