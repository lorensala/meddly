import 'package:dio/dio.dart';

/// {@template calendar_dto_exception}
/// Calendar dto exception when the calendar can't be converted to domain.
/// {@endtemplate}
class CalendarDtoException implements Exception {}

/// {@template calendar_api_exception}
/// Exception for calendar api operations failures.
/// {@endtemplate}
class CalendarNotFoundException implements Exception {}

/// {@template calendar_serialization_exception}
/// Exception for calendar serialization operations failures.
/// {@endtemplate}
class CalendarSerializationException implements Exception {}

/// {@template calendar_dio_exception}
/// Exception for calendar dio operations failures.
/// {@endtemplate}
class CalendarDioException implements Exception {
  /// {@macro calendar_api_exception}
  CalendarDioException(this.error);

  /// The error message.
  final DioError error;
}

/// {@template calendar_cache_exception}
/// Exception for calendar cache operations failures.
/// {@endtemplate}
class CalendarCacheException implements Exception {}

/// {@template calendar_dto_exception}
/// Calendar dto exception when the calendar can't be converted to domain.
/// {@endtemplate}
class ConsumptionDtoException implements Exception {}
