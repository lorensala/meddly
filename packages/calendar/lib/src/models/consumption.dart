import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption.freezed.dart';
part 'consumption.g.dart';

@freezed
class Consumption with _$Consumption {
  const factory Consumption({
    required int medicineId,
    required DateTime date,
    required DateTime realConsumptionDate,
    required bool consumed,
  }) = _Consumption;

  factory Consumption.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionFromJson(json);
}
