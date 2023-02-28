import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/dto/dto.dart';
import 'package:dio/dio.dart';

/// {@template measurement_api}
/// API for measurement operations.
/// {@endtemplate}
class MeasurementApi {
  /// {@macro measurement_api}
  MeasurementApi(Dio dio, {String? baseUrl}) : _dio = dio {
    _dio.options.baseUrl = baseUrl ?? _dio.options.baseUrl;
  }

  final Dio _dio;

  /// Creates a new measurement.
  ///
  /// Throws a [MeasurementDioException] if the request fails.
  Future<void> createMeasurement(MeasurementDto measurement) async {
    try {
      await _dio.post<dynamic>(measurementPath, data: measurement.toJson());
    } on DioError catch (e) {
      MeasurementDioException(e);
    }
  }

  /// Deletes a measurement.
  ///
  /// Throws a [MeasurementDioException] if the request fails.
  Future<void> deleteMeasurement(MeasurementDto measurement) async {
    try {
      await _dio.delete<dynamic>('$measurementPath/${measurement.id}');
    } on DioError catch (e) {
      throw MeasurementDioException(e);
    }
  }

  /// Updates a measurement.
  ///
  /// Throws a [MeasurementDioException] if the request fails.
  Future<void> updateMeasurement(MeasurementDto measurement) async {
    try {
      await _dio.post<dynamic>('$measurementPath/${measurement.id}',
          data: measurement.toJson());
    } on DioError catch (e) {
      throw MeasurementDioException(e);
    }
  }

  /// Fetches all measurements.
  ///
  /// Throws a [MeasurementDioException] if the request fails.\
  /// Throws a [MeasurementSerializationException] if the response data cannot
  /// be serialized.
  Future<List<MeasurementDto>> fetchAll() async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(measurementPath);
    } on DioError catch (e) {
      throw MeasurementDioException(e);
    }

    try {
      return res.data!
          .map((e) => MeasurementDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw MeasurementSerializationException();
    }
  }
}
