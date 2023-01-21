import 'package:dio/dio.dart';

/// {@template notification_dto_exception}
/// Exception thrown when a Notification dto operation fails.
/// {@endtemplate}
class NotificationDtoException implements Exception {}

/// {@template notification_not_found_exception}
/// Exception thrown when a Notification is not found.
/// {@endtemplate}
class NotificationNotFoundException implements Exception {}

/// {@template notification_dio_exception}
/// Exception thrown when a Notification dio operation fails.
/// {@endtemplate}
class NotificationDioException implements Exception {
  /// {@macro Notification_dio_exception}
  const NotificationDioException(this.error);

  /// The error message.
  final DioError error;
}

/// {@template notification_serialization_exception}
/// Exception thrown when a Notification serialization operation fails.
/// {@endtemplate}
class NotificationSerializationException implements Exception {}

/// {@template notification_cache_exception}
/// Exception thrown when a Notification cache operation fails.
/// {@endtemplate}
class NotificationCacheException implements Exception {}
