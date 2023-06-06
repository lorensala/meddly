sealed class CalendarEvent {
  final int id;
  final String uid;
  final String title;
  final String description;
  final DateTime date;

  const CalendarEvent({
    required this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.date,
  });
}

class MedicineEvent extends CalendarEvent {
  MedicineEvent({
    required this.consumed,
    required super.id,
    required super.uid,
    required super.title,
    required super.description,
    required super.date,
    this.consumedDate,
  });

  final bool consumed;
  final DateTime? consumedDate;
}

class AppointmentEvent extends CalendarEvent {
  AppointmentEvent({
    required super.id,
    required super.uid,
    required super.title,
    required super.description,
    required super.date,
  });
}

class MeasurementEvent extends CalendarEvent {
  MeasurementEvent({
    required super.id,
    required super.uid,
    required super.title,
    required super.description,
    required super.date,
  });
}
