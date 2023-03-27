import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

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
