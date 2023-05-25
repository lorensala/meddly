import 'package:dio/dio.dart';

/// {@template appointment_not_found_exception}
/// Exception thrown when an appointment is not found.
/// {@endtemplate}
class AppointmentNotFoundException implements Exception {}

/// {@template appointment_dio_exception}
/// Exception thrown when an appointment dio operation fails.
/// {@endtemplate}
class AppointmentDioException implements Exception {
  /// {@macro medicine_dio_exception}
  const AppointmentDioException(this.error);

  /// The error message.
  final DioError error;
}

/// {@template appointment_cache_exception}
/// Exception thrown when an appointment serialization operation fails.
/// {@endtemplate}
class AppointmentSerializationException implements Exception {}

/// {@template calendar_dto_exception}
/// Appointment dto exception when the appointment can't be converted to domain.
/// {@endtemplate}
class AppointmentDtoException implements Exception {}
