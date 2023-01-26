import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// {@template prediction_failure}
/// Failure for prediction operations.
/// {@endtemplate}
@freezed
class PredictionFailure with _$PredictionFailure {
  /// {@macro prediction_failure}
  const factory PredictionFailure.notFound() = PredictionNotFoundFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.timeout() = PredictionTimeoutFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.serialization() =
      PredictionSerializationFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.sendTimeout() = PredictionSendTimeoutFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.receiveTimeout() =
      PredictionReceiveTimeoutFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.response() = PredictionResponseFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.cancel() = PredictionCancelFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.cache() = PredictionCacheFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.unknown() = PredictionUnknownFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.alreadyExists() =
      PredictionAlreadyExistsFailure;

  /// {@macro prediction_failure}
  const factory PredictionFailure.doesNotExist() =
      PredictionDoesNotExistFailure;
}
