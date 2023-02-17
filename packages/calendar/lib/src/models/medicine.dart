import 'package:calendar/src/models/medicine_days.dart';
import 'package:calendar/src/models/medicine_dosis_unit.dart';
import 'package:calendar/src/models/medicine_presentation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine.freezed.dart';

/// {@template medicine}
/// Medicine model.
/// {@endtemplate}
@freezed
class Medicine with _$Medicine {
  /// {@macro medicine}
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
}
