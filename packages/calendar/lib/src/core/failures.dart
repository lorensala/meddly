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
  const factory CalendarFailure.connectionTimeOut() =
      CalendarConnectionTimeOutFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.response() = CalendarResponseFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.cancel() = CalendarCancelFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.cache() = CalendarCacheFailure;

  /// {@macro calendar_failure}
  const factory CalendarFailure.unknown() = CalendarUnknownFailure;
}
