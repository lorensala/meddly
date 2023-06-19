import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:medicine/medicine.dart';

part 'medicine.freezed.dart';
part 'medicine.g.dart';

@freezed
@HiveType(typeId: 2)
class Medicine with _$Medicine {
  const factory Medicine({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required DateTime startDate,
    @HiveField(3) DateTime? endDate,
    @HiveField(4) int? stock,
    @HiveField(5) int? stockWarning,
    @HiveField(6) required MedicinePresentation presentation,
    @HiveField(7) required MedicineDosisUnit dosisUnit,
    @HiveField(8) required double dosis,
    @HiveField(9) int? interval,
    @HiveField(10) @ListMedicineDayOrNullConverter() List<MedicineDay>? days,
    @HiveField(11) @ListTimeOfDayOrNullConverter() List<TimeOfDay>? hours,
    @HiveField(12) String? instructions,
  }) = _Medicine;

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
}

class ListTimeOfDayOrNullConverter
    implements JsonConverter<List<TimeOfDay>?, List<dynamic>?> {
  const ListTimeOfDayOrNullConverter();

  @override
  List<TimeOfDay>? fromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }

    return json.map((e) {
      final hour = int.parse((e as String).split(':').first);
      final minute = int.parse((e).split(':').last);
      return TimeOfDay(hour: hour, minute: minute);
    }).toList();
  }

  @override
  List<String>? toJson(List<TimeOfDay>? object) {
    if (object == null) {
      return null;
    }

    return object.map((e) => e.toHHmm()).toList();
  }
}

class ListMedicineDayOrNullConverter
    implements JsonConverter<List<MedicineDay>?, List<dynamic>?> {
  const ListMedicineDayOrNullConverter();

  @override
  List<MedicineDay>? fromJson(List<dynamic>? json) {
    if (json == null) {
      return null;
    }

    return json.map((e) => MedicineDay.fromInt(e as int)).toList();
  }

  @override
  List<int>? toJson(List<MedicineDay>? object) {
    if (object == null) {
      return null;
    }

    return object.map((e) => e.value).toList();
  }
}
