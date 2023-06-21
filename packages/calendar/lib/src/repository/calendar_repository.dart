import 'package:appointment/appointment.dart';
import 'package:calendar/calendar.dart';
import 'package:measurement/measurement.dart';
import 'package:medicine/medicine.dart';

class CalendarRepository {
  CalendarRepository({
    required CalendarApi api,
  }) : _api = api;

  final CalendarApi _api;

  Future<(CalendarException?, List<UserCalendar>)> fetchCalendar(
      [List<String> users = const <String>[]]) async {
    try {
      final List<UserCalendar> calendar = await _api.fetchAll(users);

      if (calendar.isEmpty) {
        return (null, <UserCalendar>[]);
      } else {
        final List<Appointment> appointments = [];
        final List<Measurement> measurements = [];
        final List<Consumption> consumptions = [];
        final List<Medicine> medicines = [];

        calendar.forEach((userCalendar) {
          userCalendar.forEach((userId, calendar) {
            appointments.addAll(calendar.appointments);
            measurements.addAll(calendar.measurements);
            consumptions.addAll(calendar.consumptions);
            medicines.addAll(calendar.medicines);
          });
        });

        return (null, calendar);
      }
    } on CalendarException catch (e) {
      return (e, <UserCalendar>[]);
    } catch (_) {
      return (const CalendarUnknownException(), <UserCalendar>[]);
    }
  }

  Future<(CalendarException?, void)> addConsumption(
      Consumption consumption) async {
    try {
      await _api.addConsumption(consumption);
      return (null, null);
    } on CalendarException catch (e) {
      return (e, null);
    } catch (_) {
      return (CalendarUnknownException(), null);
    }
  }

  Future<(CalendarException?, void)> removeConsumption(
      Consumption consumption) async {
    try {
      await _api.removeConsumption(consumption);
      return (null, null);
    } on CalendarException catch (e) {
      return (e, null);
    } catch (_) {
      return (CalendarUnknownException(), null);
    }
  }
}
