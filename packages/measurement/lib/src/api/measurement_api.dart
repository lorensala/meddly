import 'package:dio/dio.dart';
import 'package:measurement/src/core/core.dart';
import 'package:measurement/src/models/models.dart';

class MeasurementApi {
  const MeasurementApi(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<void> createMeasurement(Measurement measurement,
      {required CancelToken cancelToken}) async {
    try {
      await _dio.post<dynamic>(measurementPath,
          data: measurement.toJson(), cancelToken: cancelToken);
    } on DioError catch (e) {
      throw MeasurementException.fromDioError(e);
    }
  }

  Future<void> deleteMeasurement(int id,
      {required CancelToken cancelToken}) async {
    try {
      await _dio.delete<dynamic>('$measurementPath/$id');
    } on DioError catch (e) {
      throw MeasurementException.fromDioError(e);
    }
  }

  Future<void> updateMeasurement(Measurement measurement,
      {required CancelToken cancelToken}) async {
    try {
      await _dio.post<dynamic>(
        '$measurementPath/${measurement.id}',
        data: measurement.toJson(),
      );
    } on DioError catch (e) {
      throw MeasurementException.fromDioError(e);
    }
  }

  Future<List<Measurement>> fetchAll({required CancelToken cancelToken}) async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(measurementPath,
          cancelToken: cancelToken);
    } on DioError catch (e) {
      throw MeasurementException.fromDioError(e);
    }

    try {
      return res.data!
          .map((e) => Measurement.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw const MeasurementSerializationException();
    }
  }
}
