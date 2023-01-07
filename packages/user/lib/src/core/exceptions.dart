import 'package:dio/dio.dart';

/// {@template user_exception}
/// Exception for user dto operations failures.
/// {@endtemplate}
class UserDtoException implements Exception {}

/// {@template user_api_exception}
/// Exception for user api operations failures.
/// {@endtemplate}
class UserNotFoundException implements Exception {}

/// {@template user_serialization_exception}
/// Exception for user serialization operations failures.
/// {@endtemplate}
class UserSerializationException implements Exception {}

/// {@template user_dio_exception}
/// Exception for user dio operations failures.
/// {@endtemplate}
class UserDioException implements Exception {
  /// {@macro user_api_exception}
  UserDioException(this.error);

  /// The error message.
  final DioError error;
}

/// {@template user_cache_exception}
/// Exception for user cache operations failures.
/// {@endtemplate}
class UserCacheException implements Exception {}
