import 'package:appointment/appointment.dart';
import 'package:dio/dio.dart';

class AppointmentRepository {
  AppointmentRepository({required AppointmentApi api}) : _api = api;

  final AppointmentApi _api;

  Future<(AppointmentException?, List<Appointment>)> fectchAll(
      {required CancelToken cancelToken}) async {
    try {
      final appointments = await _api.fetchAll(cancelToken: cancelToken);
      return (null, appointments);
    } on AppointmentException catch (e) {
      return (e, <Appointment>[]);
    } catch (e) {
      return (const AppointmentUnknownException(), <Appointment>[]);
    }
  }

  Future<(AppointmentException?, void)> addAppointment(Appointment appointment,
      {required CancelToken cancelToken}) async {
    try {
      await _api.createAppointment(appointment, cancelToken: cancelToken);
      return (null, null);
    } on AppointmentException catch (e) {
      return (e, null);
    } catch (e) {
      return (const AppointmentUnknownException(), null);
    }
  }

  Future<(AppointmentException?, void)> deleteAppointment(int id,
      {required CancelToken cancelToken}) async {
    try {
      await _api.deleteAppointment(id, cancelToken: cancelToken);
      return (null, null);
    } on AppointmentException catch (e) {
      return (e, null);
    } catch (e) {
      return (const AppointmentUnknownException(), null);
    }
  }

  Future<(AppointmentException?, void)> updateAppointment(
      Appointment appointment,
      {required CancelToken cancelToken}) async {
    try {
      await _api.updateAppointment(appointment, cancelToken: cancelToken);
      return (null, null);
    } on AppointmentException catch (e) {
      return (e, null);
    } catch (e) {
      return (const AppointmentUnknownException(), null);
    }
  }
}
