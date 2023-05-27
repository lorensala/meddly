import 'package:appointment/appointment.dart';

class AppointmentRepository {
  AppointmentRepository({required AppointmentApi api}) : _api = api;

  final AppointmentApi _api;

  Future<(AppointmentException?, List<Appointment>)> fectchAll() async {
    try {
      final appointments = await _api.fetchAll();
      return (null, appointments);
    } on AppointmentException catch (e) {
      return (e, <Appointment>[]);
    } catch (e) {
      return (const AppointmentUnknownException(), <Appointment>[]);
    }
  }

  Future<(AppointmentException?, void)> addAppointment(
    Appointment appointment,
  ) async {
    try {
      await _api.createAppointment(appointment);
      return (null, null);
    } on AppointmentException catch (e) {
      return (e, null);
    } catch (e) {
      return (const AppointmentUnknownException(), null);
    }
  }

  Future<(AppointmentException?, void)> deleteAppointment(
    String id,
  ) async {
    try {
      await _api.deleteAppointment(id);
      return (null, null);
    } on AppointmentException catch (e) {
      return (e, null);
    } catch (e) {
      return (const AppointmentUnknownException(), null);
    }
  }

  Future<(AppointmentException?, void)> updateAppointment(
    Appointment appointment,
  ) async {
    try {
      await _api.updateAppointment(appointment);
      return (null, null);
    } on AppointmentException catch (e) {
      return (e, null);
    } catch (e) {
      return (const AppointmentUnknownException(), null);
    }
  }
}
