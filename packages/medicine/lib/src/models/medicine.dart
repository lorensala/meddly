import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medicine/src/models/medicine_days.dart';
import 'package:medicine/src/models/medicine_dosis_unit.dart';
import 'package:medicine/src/models/medicine_presentation.dart';

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
    List<MedicineDay>? days,
    List<DateTime>? hours,
    String? instructions,
  }) = _Medicine;

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
}
