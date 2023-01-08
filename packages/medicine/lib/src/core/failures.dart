import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// {@template medicine_failure}
/// Failure for medicine operations.
///
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
