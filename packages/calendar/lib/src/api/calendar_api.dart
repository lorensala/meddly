import 'package:appointment/appointment.dart';
import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/models/models.dart';
import 'package:dio/dio.dart';
import 'package:measurement/measurement.dart';

class CalendarApi {
  CalendarApi(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<
      ({
        List<Appointment> appointments,
        List<Measurement> measurements,
        List<Consumption> consumptions,
      })> fetchAll([String supervisedId = '']) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.get<dynamic>(calendarPath,
          options: supervisedId.isNotEmpty
              ? Options(
                  headers: {
                    'supervised-id': supervisedId,
                  },
                )
              : null);
    } on DioError catch (e) {
      throw CalendarException.fromDioError(e);
    }

    try {
      if (res.data == null) {
        return (
          appointments: <Appointment>[],
          measurements: <Measurement>[],
          consumptions: <Consumption>[],
        );
      }
      final appointmentsJson = res.data['appointments'] as List<dynamic>;
      final measurementsJson = res.data['measurements'] as List<dynamic>;
      final consumptionsJson = res.data['consumptions'] as List<dynamic>;

      return (
        appointments: appointmentsJson
            .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
            .toList(),
        measurements: measurementsJson
            .map((e) => Measurement.fromJson(e as Map<String, dynamic>))
            .toList(),
        consumptions: consumptionsJson
            .map((e) => Consumption.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      throw CalendarSerializationException();
    }
  }

  Future<void> addConsumption(Consumption consumption) async {
    try {
      await _dio.post<dynamic>(
        addConsumptionPath,
        data: consumption.toJson(),
      );
    } on DioError catch (e) {
      throw CalendarException.fromDioError(e);
    }
  }

  Future<void> removeConsumption(Consumption consumption) async {
    try {
      await _dio.delete<dynamic>(
        deleteConsumptionPath,
        data: consumption.toJson(),
      );
    } on DioError catch (e) {
      throw CalendarException.fromDioError(e);
    }
  }
}
