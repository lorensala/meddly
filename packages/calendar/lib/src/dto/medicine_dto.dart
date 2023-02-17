import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'medicine_dto.freezed.dart';
part 'medicine_dto.g.dart';

/// {@template medicine_dto}
/// Data transfer object for medicine.
/// {@endtemplate}
@freezed
@HiveType(typeId: 4)
class MedicineDto with _$MedicineDto {
  /// {@macro medicine_dto}
  const factory MedicineDto({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String startDate,
    @HiveField(3) String? endDate,
    @HiveField(4) int? stock,
    @HiveField(5) int? stockWarning,
    @HiveField(6) required String presentation,
    @HiveField(7) required String dosisUnit,
    @HiveField(8) required double dosis,
    @HiveField(9) int? interval,
    @HiveField(10) List<int>? days,
    @HiveField(11) List<String>? hours,
    @HiveField(12) String? instructions,
  }) = _MedicineDto;

  /// Converts a [Medicine] object to a [MedicineDto] object.
  /// Returns a [MedicineDto] object.
  /// Throws a [MedicineDtoException] if the conversion fails.
  factory MedicineDto.fromDomain(Medicine medicine) {
    try {
      return MedicineDto(
        id: medicine.id,
        name: medicine.name,
        startDate: medicine.startDate.toIso8601String(),
        endDate: medicine.endDate?.toIso8601String(),
        stock: medicine.stock,
        stockWarning: medicine.stockWarning,
        presentation: medicine.presentation.name,
        dosisUnit: medicine.dosisUnit.value,
        dosis: medicine.dosis,
        interval: medicine.interval,
        days: medicine.days?.map((e) => e.value).toList(),
        hours: medicine.hours?.map((e) => e.toString()).toList(),
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
        startDate: DateTime.parse(startDate),
        endDate: endDate != null ? DateTime.tryParse(endDate!) : null,
        stock: stock,
        stockWarning: stockWarning,
        presentation: MedicinePresentation.fromString(presentation),
        dosisUnit: MedicineDosisUnit.fromString(dosisUnit),
        dosis: dosis,
        interval: interval,
        days: days?.map(MedicineDay.fromInt).toList(),
        hours: hours?.map(fromString).toList(),
        instructions: instructions,
      );
    } catch (e) {
      throw MedicineDtoException();
    }
  }
}

/// --
TimeOfDay fromString(String s) {
  // string in format "08:10:"
  final hour = int.parse(s.substring(0, 2));
  final minute = int.parse(s.substring(3, 5));

  return TimeOfDay(hour: hour, minute: minute);
}
