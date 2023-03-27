import 'package:dio/dio.dart';

/// {@template medicine_dto_exception}
/// Medicine dto exception when the medicine can't be converted to domain.
/// {@endtemplate}
class MedicineDtoException implements Exception {}

/// {@template medicine_not_found_exception}
/// Exception thrown when a medicine is not found.
/// {@endtemplate}
class MedicineNotFoundException implements Exception {}

/// {@template medicine_dio_exception}
/// Exception thrown when a medicine dio operation fails.
/// {@endtemplate}
class MedicineDioException implements Exception {
  /// {@macro medicine_dio_exception}
  const MedicineDioException(this.error);

  /// The error message.
  final DioError error;
}

/// {@template medicine_cache_exception}
/// Exception thrown when a medicine cache operation fails.
/// {@endtemplate}
class MedicineCacheException implements Exception {}

/// {@template medicine_serialization_exception}
/// Exception thrown when a medicine serialization operation fails.
/// {@endtemplate}
class MedicineSerializationException implements Exception {}
