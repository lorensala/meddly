import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medicine/src/core/core.dart';
import 'package:medicine/src/models/models.dart';

part 'medicine_dto.freezed.dart';
part 'medicine_dto.g.dart';

/// {@template medicine_dto}
/// Data transfer object for medicine.
/// {@endtemplate}
@freezed
class MedicineDto with _$MedicineDto {
  /// {@macro medicine_dto}
  const factory MedicineDto({
    required int id,
    required String name,
    required DateTime startDate,
    DateTime? endDate,
    int? stock,
    int? stockWarning,
    required String presentation,
    required String dosisUnit,
    required double dosis,
    int? interval,
    List<int>? days,
    List<String>? hours,
    String? instructions,
  }) = _MedicineDto;

  /// Converts a [Medicine] object to a [MedicineDto] object.
  /// Returns a [MedicineDto] object.
  /// Throws a [MedicineDtoException] if the conversion fails.
  factory MedicineDto.fromDomain(Medicine medicine) {
    try {
      return MedicineDto(
        id: medicine.id,
        name: medicine.name,
        startDate: medicine.startDate,
        endDate: medicine.endDate,
        stock: medicine.stock,
        stockWarning: medicine.stockWarning,
        presentation: medicine.presentation,
        dosisUnit: medicine.dosisUnit,
        dosis: medicine.dosis,
        interval: medicine.interval,
        days: medicine.days,
        hours: medicine.hours,
        instructions: medicine.instructions,
      );
    } catch (e) {
      throw MedicineDtoException();
    }
  }

  /// {@macro medicine_dto}
  factory MedicineDto.fromJson(Map<String, dynamic> json) =>
      _$MedicineDtoFromJson(json);

  const MedicineDto._();

  /// Converts this object to a [Medicine] object.
  /// Returns a [Medicine] object.
  /// Throws a [MedicineDtoException] if the conversion fails.
  Medicine toDomain() {
    try {
      return Medicine(
        id: id,
        name: name,
        startDate: startDate,
        endDate: endDate,
        stock: stock,
        stockWarning: stockWarning,
        presentation: presentation,
        dosisUnit: dosisUnit,
        dosis: dosis,
        interval: interval,
        days: days,
        hours: hours,
        instructions: instructions,
      );
    } catch (e) {
      throw MedicineDtoException();
    }
  }
}
