import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// {@template calendar_failure}
/// Failure for Calendar operations.
/// {@endtemplate}
@freezed
class CalendarFailure with _$CalendarFailure {
  /// {@macro calendar_failure}
  const factory CalendarFailure.notFound() = CalendarNotFoundFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.timeout() = CalendarTimeoutFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.serialization() = CalendarSerializationFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.sendTimeout() = CalendarSendTimeoutFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.receiveTimeout() =
      CalendarReceiveTimeoutFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.response() = CalendarResponseFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.cancel() = CalendarCancelFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.cache() = CalendarCacheFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.unknown() = CalendarUnknownFailure;
}

/// {@template medicine_failure}
/// Failure for Medicine operations.
/// {@endtemplate}
@freezed
class MedicineFailure with _$MedicineFailure {
  /// {@macro medicine_failure}
  const factory MedicineFailure.unknown() = MedicineUnknownFailure;

  /// {@macro medicine_failure}
  const factory MedicineFailure.notFound() = MedicineNotFoundFailure;

  /// {@macro medicine_failure}
  const factory MedicineFailure.serialization() = MedicineSerializationFailure;

  /// {@macro medicine_failure}
  const factory MedicineFailure.sendTimeout() = MedicineSendTimeoutFailure;

  /// {@macro medicine_failure}
  const factory MedicineFailure.receiveTimeout() =
      MedicineReceiveTimeoutFailure;

  /// {@macro medicine_failure}
  const factory MedicineFailure.response() = MedicineResponseFailure;

  /// {@macro medicine_failure}
  const factory MedicineFailure.cancel() = MedicineCancelFailure;

  /// {@macro medicine_failure}
  const factory MedicineFailure.cache() = MedicineCacheFailure;

  /// {@macro medicine_failure}
  const factory MedicineFailure.connectionTimeOut() =
      MedicineConnectionTimeOutFailure;
}

/// {@template measurement_failure}
/// Failure for Measurement operations.
/// {@endtemplate}
@freezed
class MeasurementFailure with _$MeasurementFailure {
  /// {@macro medicine_failure}
  const factory MeasurementFailure.unknown() = MeasurementUnknownFailure;

  /// {@macro medicine_failure}
  const factory MeasurementFailure.notFound() = MeasurementNotFoundFailure;

  /// {@macro medicine_failure}
  const factory MeasurementFailure.serialization() =
      MeasurementSerializationFailure;

  /// {@macro medicine_failure}
  const factory MeasurementFailure.sendTimeout() =
      MeasurementSendTimeoutFailure;

  /// {@macro medicine_failure}
  const factory MeasurementFailure.receiveTimeout() =
      MeasurementReceiveTimeoutFailure;

  /// {@macro medicine_failure}
  const factory MeasurementFailure.response() = MeasurementResponseFailure;

  /// {@macro medicine_failure}
  const factory MeasurementFailure.cancel() = MeasurementCancelFailure;

  /// {@macro medicine_failure}
  const factory MeasurementFailure.cache() = MeasurementCacheFailure;

  /// {@macro medicine_failure}
  const factory MeasurementFailure.connectionTimeOut() =
      MeasurementConnectionTimeOutFailure;
}

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
