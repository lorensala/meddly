import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption.freezed.dart';

/// {@template consumption}
/// A consumption.
/// {@endtemplate}
@freezed
class Consumption with _$Consumption {
  /// {@macro consumption}
  const factory Consumption({
    required int id,
    required int medicineId,
    required DateTime date,
    required DateTime realConsumptionDate,
    required bool consumed,
  }) = _Consumption;
  const Consumption._();
}
