import 'package:collection/collection.dart';

/// {@template medicine_dosis_unit}
/// Dosis unit.
/// {@endtemplate}
enum MedicineDosisUnit {
  /// {@macro medicine_dosis_unit}
  mg(value: 'mg'),

  /// {@macro medicine_dosis_unit}
  mcg(value: 'mcg'),

  /// {@macro medicine_dosis_unit}
  g(value: 'g'),

  /// {@macro medicine_dosis_unit}
  mL(value: 'mL'),

  /// {@macro medicine_dosis_unit}
  percentage(value: '%');

  /// {@macro medicine_dosis_unit}
  const MedicineDosisUnit({this.value = ''});

  /// {@macro medicine_dosis_unit}
  final String value;

  /// {@macro medicine_dosis_unit}
  ///
  /// Returns the [MedicineDosisUnit] from a [String] value.
  static MedicineDosisUnit fromString(String value) {
    return MedicineDosisUnit.values.firstWhereOrNull(
          (element) => element.value == value,
        ) ??
        MedicineDosisUnit.mg;
  }
}
