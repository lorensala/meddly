import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/dto/dto.dart';
import 'package:dio/dio.dart';

/// {@template calendar_api}
/// API for Calendar operations.
/// {@endtemplate}
class CalendarApi {
  /// {@macro calendar_api}
  CalendarApi(Dio dio, {String? baseUrl}) : _dio = dio {
    _dio.options.baseUrl = baseUrl ?? _dio.options.baseUrl;
  }

  final Dio _dio;

  /// {@macro calendar_api}
  /// Fetches all calendar items.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.\
  /// Throws a [CalendarSerializationException] if the serialization was not
  /// successful.
  Future<CalendarDto> fetchAll() async {
    late final Response<dynamic> res;
    try {
      res = await _dio.get<dynamic>(calendarPath);

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }

    try {
      if (res.data == null) {
        return const CalendarDto(
          activeMedicines: [],
          appointments: [],
          measurements: [],
        );
      }
      return CalendarDto.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw CalendarSerializationException();
    }
  }

  /// {@macro calendar_api}
  /// Adds a new appointment.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> addAppointment(AppointmentDto appointmentDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        appointmentPath,
        data: appointmentDto.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Updates an appointment.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> updateAppointment(AppointmentDto appointmentDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        '$appointmentPath${appointmentDto.id}/',
        data: appointmentDto.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Deletes an appointment.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> deleteAppointment(AppointmentDto appointmentDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.delete(
        '$appointmentPath${appointmentDto.id}/',
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Adds a new medicine.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> addMedicine(MedicineDto medicineDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        medicinePath,
        data: medicineDto.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Updates a medicine.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> updateMedicine(MedicineDto medicineDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        '$medicinePath${medicineDto.id}/',
        data: medicineDto.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Deletes a medicine.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> deleteMedicine(MedicineDto medicineDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.delete(
        '$medicinePath${medicineDto.id}/',
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Adds a new consumption.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> addConsumption(ConsumptionDto consumptionDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        addConsumptionPath,
        data: consumptionDto.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Deletes a consumption.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> deleteConsumption(ConsumptionDto consumptionDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.delete(
        deleteConsumptionPath,
        data: consumptionDto.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Adds a new measurement.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> addMeasurement(MeasurementDto measurementDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        measurementPath,
        data: measurementDto.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Updates a measurement.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> updateMeasurement(MeasurementDto measurementDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post(
        '$measurementPath${measurementDto.id}/',
        data: measurementDto.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Deletes a measurement.
  ///
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.
  Future<void> deleteMeasurement(MeasurementDto measurementDto) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.delete(
        '$measurementPath${measurementDto.id}/',
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }
}
