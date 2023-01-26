import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'medicine_dto.freezed.dart';
part 'medicine_dto.g.dart';

/// {@template medicine_dto}
/// Data Transfer Object for Medicine.
/// {@endtemplate}
@freezed
@HiveType(typeId: 4)
class MedicineDto with _$MedicineDto {
  /// {@macro medicine_dto}
  const factory MedicineDto({
    @HiveField(0) required String name,
    @HiveField(1) required String startDate,
    @HiveField(2) String? endDate,
    @HiveField(3) int? stock,
    @HiveField(4) int? stockWarning,
    @HiveField(5) required String presentation,
    @HiveField(6) required String dosisUnit,
    @HiveField(7) required double dosis,
    @HiveField(8) int? interval,
    @HiveField(9) List<int>? days,
    @HiveField(10) List<String>? hours,
    @HiveField(11) String? instructions,
    @HiveField(12) required int id,
  }) = _MedicineDto;

  /// Converts a [Medicine] to a [MedicineDto].
  factory MedicineDto.fromDomain(Medicine medicine) {
    try {
      return MedicineDto(
        name: medicine.name,
        startDate: medicine.startDate.toIso8601String(),
        endDate: medicine.endDate?.toIso8601String(),
        stock: medicine.stock,
        stockWarning: medicine.stockWarning,
        presentation: medicine.presentation,
        dosisUnit: medicine.dosisUnit,
        dosis: medicine.dosis,
        interval: medicine.interval,
        days: medicine.days,
        hours: medicine.hours,
        instructions: medicine.instructions,
        id: medicine.id,
      );
    } catch (e) {
      throw MedicineDtoException();
    }
  }

  /// Creates a [MedicineDto] from a JSON object.
  factory MedicineDto.fromJson(Map<String, dynamic> json) =>
      _$MedicineDtoFromJson(json);

  const MedicineDto._();

  /// Converts a [MedicineDto] to a [Medicine].
  Medicine toDomain() {
    try {
      return Medicine(
        name: name,
        startDate: DateTime.parse(startDate),
        endDate: endDate != null ? DateTime.parse(endDate!) : null,
        stock: stock,
        stockWarning: stockWarning,
        presentation: presentation,
        dosisUnit: dosisUnit,
        dosis: dosis,
        interval: interval,
        days: days,
        hours: hours,
        instructions: instructions,
        id: id,
      );
    } catch (e) {
      throw MedicineDtoException();
    }
  }
}
