// ignore_for_file: prefer_single_quotes

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
          consumptions: [],
        );
      }
      return CalendarDto.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      throw CalendarSerializationException();
    }
  }

  /// {@macro calendar_api}
  /// Adds a [Consumption] to the calendar.
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.\
  Future<void> addConsumption(ConsumptionDto consumption) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.post<dynamic>(
        addConsumptionPath,
        data: consumption.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }

  /// {@macro calendar_api}
  /// Removes a [Consumption] from the calendar.
  /// Throws a [CalendarNotFoundException] if the calendar is not found.\
  /// Throws a [CalendarDioException] if the operation was not successful.\
  Future<void> removeConsumption(ConsumptionDto consumption) async {
    late final Response<dynamic> res;
    try {
      res = await _dio.delete<dynamic>(
        deleteConsumptionPath,
        data: consumption.toJson(),
      );

      if (res.statusCode == 401) {
        throw CalendarNotFoundException();
      }
    } on DioError catch (e) {
      throw CalendarDioException(e);
    }
  }
}
