import 'package:dio/dio.dart';
import 'package:measurement/src/api/api.dart';
import 'package:measurement/src/core/core.dart';
import 'package:measurement/src/models/models.dart';

class MeasurementRepository {
  MeasurementRepository({required MeasurementApi api}) : _api = api;

  final MeasurementApi _api;

  Future<(MeasurementException?, List<Measurement>)> fetchAll(
      {required CancelToken cancelToken}) async {
    try {
      final measurements = await _api.fetchAll(cancelToken: cancelToken);

      return (null, measurements);
    } on MeasurementException catch (e) {
      return (e, <Measurement>[]);
    } catch (e) {
      return (const MeasurementUnknownException(), <Measurement>[]);
    }
  }

  Future<(MeasurementException?, void)> createMeasurement(
      Measurement measurement,
      {required CancelToken cancelToken}) async {
    try {
      await _api.createMeasurement(measurement, cancelToken: cancelToken);

      return (null, null);
    } on MeasurementException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MeasurementUnknownException(), null);
    }
  }

  Future<(MeasurementException?, void)> deleteMeasurement(int id,
      {required CancelToken cancelToken}) async {
    try {
      await _api.deleteMeasurement(id, cancelToken: cancelToken);

      return (null, null);
    } on MeasurementException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MeasurementUnknownException(), null);
    }
  }

  Future<(MeasurementException?, void)> updateMeasurement(
      Measurement measurement,
      {required CancelToken cancelToken}) async {
    try {
      await _api.updateMeasurement(measurement, cancelToken: cancelToken);

      return (null, null);
    } on MeasurementException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MeasurementUnknownException(), null);
    }
  }
}
