import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// {@template notification_failure}
/// Failure for notification operations.
/// {@endtemplate}
@freezed
class NotificationFailure with _$NotificationFailure {
  /// {@macro notification_failure}
  const factory NotificationFailure.notFound() = NotificationNotFoundFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.timeout() = NotificationTimeoutFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.serialization() =
      NotificationSerializationFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.sendTimeout() =
      NotificationSendTimeoutFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.receiveTimeout() =
      NotificationReceiveTimeoutFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.response() = NotificationResponseFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.connectionTimeOut() =
      NotificationConnectionTimeOutFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.cancel() = NotificationCancelFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.cache() = NotificationCacheFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.unknown() = NotificationUnknownFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.alreadyExists() =
      NotificationAlreadyExistsFailure;

  /// {@macro notification_failure}
  const factory NotificationFailure.doesNotExist() =
      NotificationDoesNotExistFailure;
}
