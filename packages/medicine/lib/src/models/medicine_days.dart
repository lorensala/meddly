enum MedicineDay {
  monday(value: 1),
  tuesday(value: 2),
  wednesday(value: 3),
  thursday(value: 4),
  friday(value: 5),
  saturday(value: 6),
  sunday(value: 7);

  const MedicineDay({required this.value})
      : assert(value >= 1 && value <= 7, 'value must be between 1 and 7');

  final int value;

  static MedicineDay fromInt(int day) {
    if (day < 1 || day > 7) {
      throw ArgumentError('day must be between 1 and 7');
    }

    return MedicineDay.values[day - 1];
  }
}
