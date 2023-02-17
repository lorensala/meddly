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

@freezed
class MedicineFailure with _$MedicineFailure {
  /// {@macro medicine_failure}
  const factory MedicineFailure.unknown() = _Unknown;

  /// {@macro medicine_failure}
  const factory MedicineFailure.notFound() = _NotFound;

  /// {@macro medicine_failure}
  const factory MedicineFailure.serialization() = _Serialization;

  /// {@macro medicine_failure}
  const factory MedicineFailure.sendTimeout() = _SendTimeout;

  /// {@macro medicine_failure}
  const factory MedicineFailure.receiveTimeout() = _ReceiveTimeout;

  /// {@macro medicine_failure}
  const factory MedicineFailure.response() = _Response;

  /// {@macro medicine_failure}
  const factory MedicineFailure.cancel() = _Cancel;

  /// {@macro medicine_failure}
  const factory MedicineFailure.cache() = _Cache;

  /// {@macro medicine_failure}
  const factory MedicineFailure.connectionTimeOut() = _ConnectionTimeOut;
}
