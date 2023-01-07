import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// {@template user_failure}
/// Failure for user operations.
/// {@endtemplate}
@freezed
class UserFailure with _$UserFailure {
  /// {@macro user_failure}
  const factory UserFailure.notFound() = UserNotFoundFailure;

  /// {@macro user_failure}
  const factory UserFailure.timeout() = UserTimeoutFailure;

  /// {@macro user_failure}
  const factory UserFailure.serialization() = UserSerializationFailure;

  /// {@macro user_failure}
  const factory UserFailure.sendTimeout() = UserSendTimeoutFailure;

  /// {@macro user_failure}
  const factory UserFailure.receiveTimeout() = UserReceiveTimeoutFailure;

  /// {@macro user_failure}
  const factory UserFailure.response() = UserResponseFailure;

  /// {@macro user_failure}
  const factory UserFailure.cancel() = UserCancelFailure;

  /// {@macro user_failure}
  const factory UserFailure.cache() = UserCacheFailure;

  /// {@macro user_failure}
  const factory UserFailure.unknown() = UserUnknownFailure;
}
