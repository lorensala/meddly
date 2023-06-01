import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medicine/medicine.dart';

part 'medicine.freezed.dart';
part 'medicine.g.dart';

@freezed
class Medicine with _$Medicine {
  const factory Medicine({
    required int id,
    required String name,
    required DateTime startDate,
    DateTime? endDate,
    int? stock,
    int? stockWarning,
    required MedicinePresentation presentation,
    required MedicineDosisUnit dosisUnit,
    required double dosis,
    int? interval,
    @ListMedicineDayOrNullConverter() List<MedicineDay>? days,
    @ListTimeOfDayOrNullConverter() List<TimeOfDay>? hours,
    String? instructions,
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
