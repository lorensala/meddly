import 'package:appointment/appointment.dart';
import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/models/models.dart';
import 'package:dio/dio.dart';
import 'package:measurement/measurement.dart';
import 'package:medicine/medicine.dart';

typedef UserCalendar = Map<String, Calendar>;

typedef Calendar = ({
  List<Appointment> appointments,
  List<Measurement> measurements,
  List<Consumption> consumptions,
  List<Medicine> medicines,
});

class CalendarApi {
  CalendarApi(Dio dio) : _dio = dio;

  final Dio _dio;

  Future<List<UserCalendar>> fetchAll(
      [List<String> users = const <String>[]]) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.get<dynamic>(calendarPath,
          queryParameters: users.isEmpty
              ? {
                  'start': DateTime.now().subtract(const Duration(days: 60)),
                  'end': DateTime.now().add(const Duration(days: 60)),
                }
              : {
                  'start': DateTime.now().subtract(const Duration(days: 60)),
                  'end': DateTime.now().add(const Duration(days: 60)),
                  'users': users,
                });
    } on DioError catch (e) {
      throw CalendarException.fromDioError(e);
    }

    try {
      final List<UserCalendar> calendar = [];

      if (res.data == null) {
        return [];
      }

      final data = res.data as Map<String, dynamic>;

      data.forEach((String userId, userCalendar) {
        final appointments = userCalendar['appointments'] as List<dynamic>;
        final measurements = userCalendar['measurements'] as List<dynamic>;
        final consumptions = userCalendar['consumptions'] as List<dynamic>;
        final medicines = userCalendar['medicines'] as List<dynamic>;

        calendar.add({
          userId: (
            appointments: appointments
                .map<Appointment>((e) => Appointment.fromJson(
                      e as Map<String, dynamic>,
                    ))
                .toList(),
            measurements: measurements
                .map<Measurement>((e) => Measurement.fromJson(
                      e as Map<String, dynamic>,
                    ))
                .toList(),
            consumptions: consumptions
                .map<Consumption>((e) => Consumption.fromJson(
                      e as Map<String, dynamic>,
                    ))
                .toList(),
            medicines: medicines
                .map<Medicine>((e) => Medicine.fromJson(
                      e as Map<String, dynamic>,
                    ))
                .toList(),
          )
        });
      });

      return calendar;
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
