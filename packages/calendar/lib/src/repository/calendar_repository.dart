import 'package:calendar/src/api/api.dart';
import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/models/models.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// {@template calendar_repository}
/// Repository for the calendar.
/// {@endtemplate}
class CalendarRepository {
  /// {@macro calendar_repository}
  CalendarRepository({
    required CalendarApi api,
  }) : _api = api;

  final CalendarApi _api;

  /// Fetches the [Calendar]s from the [CalendarApi]
  ///
  /// Returns a [CalendarFailure] if the [Calendar] fails to load.
  Future<Either<CalendarFailure, Unit>> fetchCalendar() async {
    try {
      await _api.fetchAll();

      return right(unit);
    } on CalendarCacheException {
      return left(const CalendarFailure.cache());
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.sendTimeout());
        case DioErrorType.badResponse:
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.connectionTimeout:
          return left(const CalendarFailure.connectionTimeOut());
        case DioErrorType.badCertificate:
          return left(const CalendarFailure.unknown());
        case DioErrorType.connectionError:
          return left(const CalendarFailure.connectionTimeOut());
        case DioErrorType.unknown:
          return left(const CalendarFailure.unknown());
      }
    } on CalendarSerializationException {
      return left(const CalendarFailure.serialization());
    }
  }
}
