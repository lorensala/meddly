import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// {@template appointment_failure}
/// Failure for the appointment.
/// {@endtemplate}
@freezed
class AppointmentFailure with _$AppointmentFailure {
  /// {@macro medicine_failure}
  const factory AppointmentFailure.unknown() = AppointmentUnknownFailure;

  /// {@macro medicine_failure}
  const factory AppointmentFailure.notFound() = AppointmentNotFoundFailure;

  /// {@macro medicine_failure}
  const factory AppointmentFailure.serialization() =
      AppointmentSerializationFailure;

  /// {@macro medicine_failure}
  const factory AppointmentFailure.sendTimeout() =
      AppointmentSendTimeoutFailure;

  /// {@macro medicine_failure}
  const factory AppointmentFailure.receiveTimeout() =
      AppointmentReceiveTimeoutFailure;

  /// {@macro medicine_failure}
  const factory AppointmentFailure.response() = AppointmentResponseFailure;

  /// {@macro medicine_failure}
  const factory AppointmentFailure.cancel() = AppointmentCancelFailure;

  /// {@macro medicine_failure}
  const factory AppointmentFailure.cache() = AppointmentCacheFailure;

  /// {@macro medicine_failure}
  const factory AppointmentFailure.connectionTimeOut() =
      AppointmentConnectionTimeOutFailure;
}
