import 'package:freezed_annotation/freezed_annotation.dart';

part 'measurement.freezed.dart';

/// {@template measurement}
/// A measurement.
/// {@endtemplate}
@freezed
class Measurement with _$Measurement {
  /// {@macro measurement}
  const factory Measurement({
    required DateTime date,
    required String type,
    required double value,
    required int id,
  }) = _Measurement;
  const Measurement._();
}
