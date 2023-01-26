import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/dto/dto.dart';
import 'package:hive/hive.dart';
import 'package:rxdart/rxdart.dart';

/// {@template calendar_cache}
/// Cache for the calendar.
/// {@endtemplate}
class CalendarCache {
  /// {@macro calendar_cache}
  CalendarCache({
    required Box<AppointmentDto> appointmentBox,
    required Box<MeasurementDto> measurementBox,
    required Box<CalendarDto> calendarBox,
    required Box<MedicineDto> medicineBox,
    required Box<ConsumptionDto> consumptionBox,
  })  : _appointmentBox = appointmentBox,
        _measurementBox = measurementBox,
        _calendarBox = calendarBox,
        _medicineBox = medicineBox,
        _consumptionBox = consumptionBox;

  final Box<AppointmentDto> _appointmentBox;
  final Box<MeasurementDto> _measurementBox;
  final Box<CalendarDto> _calendarBox;
  final Box<MedicineDto> _medicineBox;
  final Box<ConsumptionDto> _consumptionBox;

  /// Stream of [AppointmentDto]s.
  Stream<List<AppointmentDto>> get appointments => _appointmentBox
          .watch()
          .map((BoxEvent event) => event.value as List<AppointmentDto>)
          .map((List<AppointmentDto> appointments) {
        appointments.sort(
          (AppointmentDto a, AppointmentDto b) => a.date.compareTo(b.date),
        );
        return appointments;
      }).startWith(_appointmentBox.values.toList());

  /// Stream of [MeasurementDto]s.
  Stream<List<MeasurementDto>> get measurements => _measurementBox
          .watch()
          .map((BoxEvent event) => event.value as List<MeasurementDto>)
          .map((List<MeasurementDto> measurements) {
        measurements.sort(
          (MeasurementDto a, MeasurementDto b) => a.date.compareTo(b.date),
        );
        return measurements;
      }).startWith(_measurementBox.values.toList());

  /// Stream of [MedicineDto]s.
  Stream<List<MedicineDto>> get medicines => _medicineBox
          .watch()
          .map((BoxEvent event) => event.value as List<MedicineDto>)
          .map((List<MedicineDto> medicines) {
        medicines.sort(
          (MedicineDto a, MedicineDto b) => a.name.compareTo(b.name),
        );
        return medicines;
      }).startWith(_medicineBox.values.toList());

  /// Stream of [ConsumptionDto]s.
  Stream<List<ConsumptionDto>> get consumptions => _consumptionBox
          .watch()
          .map((BoxEvent event) => event.value as List<ConsumptionDto>)
          .map((List<ConsumptionDto> consumptions) {
        consumptions.sort(
          (ConsumptionDto a, ConsumptionDto b) => a.date.compareTo(b.date),
        );
        return consumptions;
      }).startWith(_consumptionBox.values.toList());

  /// Stream of [CalendarDto].
  Stream<CalendarDto?> get calendar => _calendarBox
      .watch()
      .map((BoxEvent event) => event.value as CalendarDto?)
      .startWith(_calendarBox.get(calendarBoxKey));

  /// Writes an [AppointmentDto] to the cache.
  ///
  /// If the [AppointmentDto] already exists, it will be overwritten.
  /// Throws a [CalendarCacheException] if the write fails.
  Future<void> writeAppointment(AppointmentDto appointmentDto) async {
    try {
      await _appointmentBox.put(appointmentDto.id, appointmentDto);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Writes a [MeasurementDto] to the cache.
  ///
  /// If the [MeasurementDto] already exists, it will be overwritten.
  /// Throws a [CalendarCacheException] if the write fails.
  Future<void> writeMeasurement(MeasurementDto measurementDto) async {
    try {
      await _measurementBox.put(measurementDto.id, measurementDto);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Writes a [CalendarDto] to the cache.
  ///
  /// If the [CalendarDto] already exists, it will be overwritten.
  ///
  Future<void> writeCalendar(CalendarDto calendarDto) async {
    try {
      await _calendarBox.put(calendarBoxKey, calendarDto);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Writes a [MedicineDto] to the cache.
  ///
  /// If the [MedicineDto] already exists, it will be overwritten.
  /// Throws a [CalendarCacheException] if the write fails.
  Future<void> writeMedicine(MedicineDto medicineDto) async {
    try {
      await _medicineBox.put(medicineDto.id, medicineDto);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Writes a [ConsumptionDto] to the cache.
  ///
  /// If the [ConsumptionDto] already exists, it will be overwritten.
  /// Throws a [CalendarCacheException] if the write fails.
  Future<void> writeConsumption(ConsumptionDto consumptionDto) async {
    try {
      await _consumptionBox.put(consumptionDto.id, consumptionDto);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Reads an [AppointmentDto] from the cache.
  ///
  /// Returns `null` if the [AppointmentDto] does not exist.
  /// Throws a [CalendarCacheException] if the read fails.
  Future<AppointmentDto?> readAppointment(int id) async {
    try {
      return _appointmentBox.get(id);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Reads a [MeasurementDto] from the cache.
  ///
  /// Returns `null` if the [MeasurementDto] does not exist.
  /// Throws a [CalendarCacheException] if the read fails.
  Future<MeasurementDto?> readMeasurement(int id) async {
    try {
      return _measurementBox.get(id);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Reads a [CalendarDto] from the cache.
  ///
  /// Returns `null` if the [CalendarDto] does not exist.
  /// Throws a [CalendarCacheException] if the read fails.
  Future<CalendarDto?> readCalendar() async {
    try {
      return _calendarBox.get(calendarBoxKey);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Reads a [MedicineDto] from the cache.
  ///
  /// Returns `null` if the [MedicineDto] does not exist.
  /// Throws a [CalendarCacheException] if the read fails.
  Future<MedicineDto?> readMedicine(int id) async {
    try {
      return _medicineBox.get(id);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Reads a [ConsumptionDto] from the cache.
  ///
  /// Returns `null` if the [ConsumptionDto] does not exist.
  /// Throws a [CalendarCacheException] if the read fails.
  Future<ConsumptionDto?> readConsumption(int id) async {
    try {
      return _consumptionBox.get(id);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Reads all [AppointmentDto]s from the cache.
  ///
  /// Throws a [CalendarCacheException] if the read fails.
  Future<void> deleteAppointment(int id) async {
    try {
      await _appointmentBox.delete(id);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Reads all [MeasurementDto]s from the cache.
  ///
  /// Throws a [CalendarCacheException] if the read fails.
  Future<void> deleteMeasurement(int id) async {
    try {
      await _measurementBox.delete(id);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Reads all [MedicineDto]s from the cache.
  ///
  /// Throws a [CalendarCacheException] if the read fails.
  Future<void> deleteMedicine(int id) async {
    try {
      await _medicineBox.delete(id);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Reads all [ConsumptionDto]s from the cache.
  ///
  /// Throws a [CalendarCacheException] if the read fails.
  Future<void> deleteConsumption(int id) async {
    try {
      await _consumptionBox.delete(id);
    } catch (e) {
      throw CalendarCacheException();
    }
  }

  /// Deletes all data from the cache.
  ///
  /// Throws a [CalendarCacheException] if the delete fails.
  Future<void> deleteAll() async {
    try {
      await _appointmentBox.deleteAll(_appointmentBox.keys);
      await _measurementBox.deleteAll(_measurementBox.keys);
      await _medicineBox.deleteAll(_medicineBox.keys);
      await _consumptionBox.deleteAll(_consumptionBox.keys);
    } catch (e) {
      throw CalendarCacheException();
    }
  }
}
