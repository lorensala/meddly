import 'package:appointment/src/core/core.dart';
import 'package:appointment/src/models/models.dart';
import 'package:dio/dio.dart';

class AppointmentApi {
  const AppointmentApi(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<void> createAppointment(Appointment appointment) async {
    try {
      await _dio.post<dynamic>(appointmentPath, data: appointment.toJson());
    } on DioError catch (e) {
      throw AppointmentException.fromDioError(e);
    }
  }

  Future<void> deleteAppointment(int id) async {
    try {
      await _dio.delete<dynamic>('$appointmentPath/$id');
    } on DioError catch (e) {
      throw AppointmentException.fromDioError(e);
    }
  }

  Future<void> updateAppointment(Appointment appointment) async {
    try {
      await _dio.post<dynamic>(
        '$appointmentPath/${appointment.id}',
        data: appointment.toJson(),
      );
    } on DioError catch (e) {
      throw AppointmentException.fromDioError(e);
    }
  }

  Future<List<Appointment>> fetchAll() async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(appointmentPath);
    } on DioError catch (e) {
      throw AppointmentException.fromDioError(e);
    }

    try {
      return res.data!
          .map((e) => Appointment.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw const AppointmentSerializationException();
    }
  }
}
