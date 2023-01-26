import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicine.freezed.dart';

/// {@template medicine}
/// A medicine.
/// {@endtemplate}
@freezed
class Medicine with _$Medicine {
  /// {@macro medicine}
  const factory Medicine({
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
    required int id,
  }) = _Medicine;
  const Medicine._();
}
