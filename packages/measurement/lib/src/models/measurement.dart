import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:measurement/measurement.dart';

part 'measurement.freezed.dart';
part 'measurement.g.dart';

@freezed
class Measurement with _$Measurement {
  const factory Measurement({
    required DateTime date,
    required MeasurementType type,
    required double value,
    required int id,
  }) = _Measurement;

  factory Measurement.fromJson(Map<String, dynamic> json) =>
      _$MeasurementFromJson(json);
}
