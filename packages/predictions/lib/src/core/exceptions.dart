import 'package:dio/dio.dart';

/// {@template Prediction_not_found_exception}
/// Exception thrown when a prediction is not found.
/// {@endtemplate}
class PredictionNotFoundException implements Exception {}

/// {@template Prediction_dio_exception}
/// Exception thrown when a prediction dio operation fails.
/// {@endtemplate}
class PredictionDioException implements Exception {
  /// {@macro Prediction_dio_exception}
  const PredictionDioException(this.error);

  /// The error message.
  final DioError error;
}

/// {@template Prediction_serialization_exception}
/// Exception thrown when a prediction serialization operation fails.
/// {@endtemplate}
class PredictionSerializationException implements Exception {}

/// {@template Prediction_cache_exception}
/// Exception thrown when a prediction cache operation fails.
/// {@endtemplate}
class PredictionCacheException implements Exception {}
