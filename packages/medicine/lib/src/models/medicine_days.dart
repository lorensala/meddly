import 'package:medicine/src/dto/dto.dart' show MedicineDto;

/// {@template medicine_days}
/// Days of the week for a medicine on specific days frecuency.
/// {@endtemplate}
enum MedicineDay {
  /// {@macro medicine_days}
  monday(value: 1),

  /// {@macro medicine_days}
  tuesday(value: 2),

  /// {@macro medicine_days}
  wednesday(value: 3),

  /// {@macro medicine_days}
  thursday(value: 4),

  /// {@macro medicine_days}
  friday(value: 5),

  /// {@macro medicine_days}
  saturday(value: 6),

  /// {@macro medicine_days}
  sunday(value: 7);

  /// {@macro medicine_days}
  const MedicineDay({required this.value})
      : assert(value >= 1 && value <= 7, 'value must be between 1 and 7');

  /// {@macro medicine_days}
  ///
  /// day value required by the [MedicineDto]
  final int value;

  /// {@macro medicine_days}
  ///
  /// Returns a [MedicineDay] from an [int].
  static MedicineDay fromInt(int day) {
    if (day < 1 || day > 7) {
      throw ArgumentError('day must be between 1 and 7');
    }

    return MedicineDay.values[day - 1];
  }
}
