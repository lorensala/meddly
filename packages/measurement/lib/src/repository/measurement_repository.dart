import 'package:measurement/src/api/api.dart';
import 'package:measurement/src/core/core.dart';
import 'package:measurement/src/models/models.dart';

class MeasurementRepository {
  MeasurementRepository({required MeasurementApi api}) : _api = api;

  final MeasurementApi _api;

  Future<(MeasurementException?, List<Measurement>)> fetchAll() async {
    try {
      final measurements = await _api.fetchAll();

      return (null, measurements);
    } on MeasurementException catch (e) {
      return (e, <Measurement>[]);
    } catch (e) {
      return (const MeasurementUnknownException(), <Measurement>[]);
    }
  }

  Future<(MeasurementException?, void)> addMeasurement(
    Measurement measurement,
  ) async {
    try {
      await _api.createMeasurement(measurement);

      return (null, null);
    } on MeasurementException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MeasurementUnknownException(), null);
    }
  }

  Future<(MeasurementException?, void)> deleteMeasurement(
    int id,
  ) async {
    try {
      await _api.deleteMeasurement(id);

      return (null, null);
    } on MeasurementException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MeasurementUnknownException(), null);
    }
  }

  Future<(MeasurementException?, void)> updateMeasurement(
    Measurement measurement,
  ) async {
    try {
      await _api.updateMeasurement(measurement);

      return (null, null);
    } on MeasurementException catch (e) {
      return (e, null);
    } catch (e) {
      return (const MeasurementUnknownException(), null);
    }
  }
}
