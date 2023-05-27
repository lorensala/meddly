import 'package:appointment/appointment.dart';
import 'package:calendar/calendar.dart';
import 'package:measurement/measurement.dart';
import 'package:medicine/medicine.dart';

class CalendarRepository {
  CalendarRepository({
    required CalendarApi api,
  }) : _api = api;

  final CalendarApi _api;

  Future<
      ({
        CalendarException? err,
        List<Medicine> activeMedicines,
        List<Appointment> appointments,
        List<Measurement> measurements,
        List<Consumption> consumptions,
      })> fetchCalendar() async {
    try {
      final (:activeMedicines, :appointments, :measurements, :consumptions) =
          await _api.fetchAll();

      return (
        err: null,
        activeMedicines: activeMedicines,
        appointments: appointments,
        measurements: measurements,
        consumptions: consumptions,
      );
    } on CalendarException catch (e) {
      return (
        err: e,
        activeMedicines: <Medicine>[],
        appointments: <Appointment>[],
        measurements: <Measurement>[],
        consumptions: <Consumption>[]
      );
    } catch (_) {
      return (
        err: CalendarUnknownException(),
        activeMedicines: <Medicine>[],
        appointments: <Appointment>[],
        measurements: <Measurement>[],
        consumptions: <Consumption>[]
      );
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
