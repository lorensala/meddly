List<DateTime> getAllDaysInYear() {
  final start = DateTime(DateTime.now().year);
  final end = DateTime(DateTime.now().year + 1);
  final days = <DateTime>[];
  for (var date = start;
      date.isBefore(end);
      date = date.add(const Duration(days: 1))) {
    days.add(date);
  }
  return days;
}
