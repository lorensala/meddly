import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

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
