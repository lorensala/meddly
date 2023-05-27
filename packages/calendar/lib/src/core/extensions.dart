import 'package:calendar/calendar.dart';

extension ConsumptionX on Consumption {
  bool isEqual(Consumption consumption) {
    return (medicineId == consumption.medicineId) && (date == consumption.date);
  }
}
