import 'package:dio/dio.dart';

/// {@template calendar_dto_exception}
/// Measurement dto exception when the measurement can't be converted to domain.
/// {@endtemplate}
class MeasurementDtoException implements Exception {}

/// {@template calendar_dio_exception}
/// Exception for calendar dio operations failures.
/// {@endtemplate}
class MeasurementDioException implements Exception {
  /// {@macro calendar_api_exception}
  MeasurementDioException(this.error);

  /// The error message.
  final DioError error;
}

/// {@template calendar_cache_exception}
/// Exception for calendar cache operations failures.
/// {@endtemplate}
class MeasurementCacheException implements Exception {}

/// {@template measurement_not_found_exception}
/// Exception thrown when a measurement is not found.
/// {@endtemplate}
class MeasurementNotFoundException implements Exception {}

/// {@template measurement_serialization_exception}
/// Exception thrown when a measurement serialization operation fails.
/// {@endtemplate}
class MeasurementSerializationException implements Exception {}
