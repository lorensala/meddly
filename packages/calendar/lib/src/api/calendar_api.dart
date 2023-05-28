import 'package:appointment/appointment.dart';
import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/models/models.dart';
import 'package:dio/dio.dart';
import 'package:measurement/measurement.dart';
import 'package:medicine/medicine.dart';

class CalendarApi {
  CalendarApi(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<
      ({
        List<Medicine> activeMedicines,
        List<Appointment> appointments,
        List<Measurement> measurements,
        List<Consumption> consumptions,
      })> fetchAll() async {
    late final Response<dynamic> res;
    try {
      res = await _dio.get<dynamic>(calendarPath);
    } on DioError catch (e) {
      throw CalendarException.fromDioError(e);
    }

    try {
      if (res.data == null) {
        return (
          activeMedicines: <Medicine>[],
          appointments: <Appointment>[],
          measurements: <Measurement>[],
          consumptions: <Consumption>[],
        );
      }
      final activeMedicinesJson = res.data['active_medicines'] as List<dynamic>;
      final appointmentsJson = res.data['appointments'] as List<dynamic>;
      final measurementsJson = res.data['measurements'] as List<dynamic>;
      final consumptionsJson = res.data['consumptions'] as List<dynamic>;

      return (
        activeMedicines: activeMedicinesJson
            .map((e) => Medicine.fromJson(e as Map<String, dynamic>))
            .toList(),
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
