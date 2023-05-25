import 'package:appointment/src/core/core.dart';
import 'package:appointment/src/dto/dto.dart';
import 'package:dio/dio.dart';

/// {@template appointment_api}
/// API for appointment operations.
/// {@endtemplate}
class AppointmentApi {
  /// {@macro appointment_api}
  AppointmentApi(Dio dio, {String? baseUrl}) : _dio = dio {
    _dio.options.baseUrl = baseUrl ?? _dio.options.baseUrl;
  }

  final Dio _dio;

  /// Creates a new Appointment.
  ///
  /// Throws a [AppointmentDioException] if the request fails.
  Future<void> createAppointment(AppointmentDto appointment) async {
    try {
      await _dio.post<dynamic>(appointmentPath, data: appointment.toJson());
    } on DioError catch (e) {
      AppointmentDioException(e);
    }
  }

  /// Deletes a Appointment.
  ///
  /// Throws a [AppointmentDioException] if the request fails.
  Future<void> deleteAppointment(AppointmentDto appointment) async {
    try {
      await _dio.delete<dynamic>('$appointmentPath/${appointment.id}');
    } on DioError catch (e) {
      throw AppointmentDioException(e);
    }
  }

  /// Updates a Appointment.
  ///
  /// Throws a [AppointmentDioException] if the request fails.
  Future<void> updateAppointment(AppointmentDto appointment) async {
    try {
      await _dio.post<dynamic>(
        '$appointmentPath/${appointment.id}',
        data: appointment.toJson(),
      );
    } on DioError catch (e) {
      throw AppointmentDioException(e);
    }
  }

  /// Fetches all Appointments.
  ///
  /// Throws a [AppointmentDioException] if the request fails.\
  /// Throws a [AppointmentSerializationException] if the response data cannot
  /// be serialized.
  Future<List<AppointmentDto>> fetchAll() async {
    late final Response<List<dynamic>> res;
    try {
      res = await _dio.get<List<dynamic>>(appointmentPath);
    } on DioError catch (e) {
      throw AppointmentDioException(e);
    }

    try {
      return res.data!
          .map((e) => AppointmentDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      throw AppointmentSerializationException();
    }
  }
}
