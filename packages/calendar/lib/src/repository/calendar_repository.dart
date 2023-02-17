import 'package:calendar/src/api/api.dart';
import 'package:calendar/src/cache/calendar_cache.dart';
import 'package:calendar/src/core/core.dart';
import 'package:calendar/src/dto/dto.dart';
import 'package:calendar/src/models/models.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

/// {@template calendar_repository}
/// Repository for the calendar.
/// {@endtemplate}
class CalendarRepository {
  /// {@macro calendar_repository}
  CalendarRepository({
    required CalendarCache cache,
    required CalendarApi api,
  })  : _cache = cache,
        _api = api;

  final CalendarCache _cache;
  final CalendarApi _api;

  /// Stream of [CalendarDto].
  ///
  /// Emits a [CalendarDto] whenever the calendar cache changes.
  ///
  /// Emits a [CalendarFailure] if the calendar cache fails to load.
  Stream<Either<CalendarFailure, List<Event>>> get events =>
      _cache.calendar.map<Either<CalendarFailure, List<Event>>>(
        (calendar) {
          if (calendar == null) {
            return const Right(<Event>[]);
          }

          return Right(calendar.toEvents());
        },
      ).onErrorReturnWith((error, stackTrace) {
        if (error is CalendarCacheException) {
          return const Left(CalendarFailure.cache());
        } else if (error is CalendarSerializationException) {
          return const Left(CalendarFailure.serialization());
        }

        return const Left(CalendarFailure.unknown());
      });

  /// Stream of list of [Appointment]s.
  ///
  /// Emits a list of [Appointment]s whenever the list of [AppointmentDto]s
  /// changes.
  ///
  /// Emits a [CalendarFailure] if the list of [AppointmentDto]s fails to load.
  // Stream<Either<CalendarFailure, List<Appointment>>> get appointments =>
  //     _cache.appointments.map<Either<CalendarFailure, List<Appointment>>>(
  //       (appointments) {
  //         return right(
  //           appointments.map((appointment) => appointment.toDomain()).toList(),
  //         );
  //       },
  //     );

  /// Stream of list of [Measurement]s.
  ///
  /// Emits a list of [Measurement]s whenever the list of [MeasurementDto]s
  /// changes.
  ///
  /// Emits a [CalendarFailure] if the list of [MeasurementDto]s fails to load.
  // Stream<Either<CalendarFailure, List<Measurement>>> get measurements =>
  //     _cache.measurements.map<Either<CalendarFailure, List<Measurement>>>(
  //       (measurements) {
  //         return right(
  //           measurements.map((measurement) => measurement.toDomain()).toList(),
  //         );
  //       },
  //     );

  /// Stream of list of [Medicine]s.
  ///
  /// Emits a list of [Medicine]s whenever the list of [MedicineDto]s
  /// changes.
  ///
  /// Emits a [CalendarFailure] if the list of [MedicineDto]s fails to load.
  // Stream<Either<CalendarFailure, List<Medicine>>> get medicines =>
  //     _cache.medicines.map<Either<CalendarFailure, List<Medicine>>>(
  //       (medicines) {
  //         return right(
  //           medicines.map((medicine) => medicine.toDomain()).toList(),
  //         );
  //       },
  //     );

  /// Stream of list of [Consumption]s.
  ///
  /// Emits a list of [Consumption]s whenever the list of [ConsumptionDto]s
  /// changes.
  ///
  /// Emits a [CalendarFailure] if the list of [ConsumptionDto]s fails to load.
  // Stream<Either<CalendarFailure, List<Consumption>>> get consumptions =>
  //     _cache.consumptions.map<Either<CalendarFailure, List<Consumption>>>(
  //       (consumptions) {
  //         return right(
  //           consumptions.map((consumption) => consumption.toDomain()).toList(),
  //         );
  //       },
  //     );

  /// Fetches the [Calendar]s from the [CalendarApi]
  ///
  /// Returns a [CalendarFailure] if the [Calendar] fails to load.
  Future<Either<CalendarFailure, Unit>> fetchCalendar() async {
    try {
      final appointments = await _api.fetchAll();

      await _cache.writeCalendar(appointments);
      return right(unit);
    } on CalendarCacheException {
      return left(const CalendarFailure.cache());
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.timeout());
        case DioErrorType.response:
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.other:
          return left(const CalendarFailure.unknown());
      }
    } on CalendarSerializationException {
      return left(const CalendarFailure.serialization());
    }
  }

  /// Adds an [Appointment] to the calendar.
  ///
  /// Returns a [CalendarFailure] if the [Appointment] fails to add.
  Future<Either<CalendarFailure, Unit>> addAppointment(
    Appointment appointment,
  ) async {
    try {
      final dto = AppointmentDto.fromDomain(appointment);
      await _api.addAppointment(dto);

      final calendar = await _cache.readCalendar();

      if (calendar == null) {
        await _cache.writeCalendar(
          CalendarDto(appointments: [dto]),
        );
      } else {
        await _cache.writeCalendar(
          calendar.copyWith(appointments: [...calendar.appointments, dto]),
        );
      }

      return right(unit);
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.timeout());
        case DioErrorType.response:
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.other:
          return left(const CalendarFailure.unknown());
      }
    }
  }

  /// Adds a [Measurement] to the calendar.
  ///
  /// Returns a [CalendarFailure] if the [Measurement] fails to add.
  Future<Either<CalendarFailure, Unit>> addMeasurement(
    Measurement measurement,
  ) async {
    try {
      final dto = MeasurementDto.fromDomain(measurement);
      await _api.addMeasurement(dto);

      final calendar = await _cache.readCalendar();
      if (calendar == null) {
        await _cache.writeCalendar(
          CalendarDto(measurements: [dto]),
        );
      } else {
        await _cache.writeCalendar(
          calendar.copyWith(measurements: [...calendar.measurements, dto]),
        );
      }

      return right(unit);
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.timeout());
        case DioErrorType.response:
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.other:
          return left(const CalendarFailure.unknown());
      }
    }
  }

  /// Adds a [Consumption] to the calendar.
  ///
  /// Returns a [CalendarFailure] if the [Consumption] fails to add.
  Future<Either<CalendarFailure, Unit>> addConsumption(
    Consumption consumption,
  ) async {
    try {
      final dto = ConsumptionDto.fromDomain(consumption);
      await _api.addConsumption(dto);

      await _cache.writeConsumption(dto);

      return right(unit);
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.timeout());
        case DioErrorType.response:
          // ignore: avoid_dynamic_calls
          // switch(e.error.response?.data?['detail']['code'] as int ) {
          //   case 400:
          //     return left(const CalendarFailure.invalidConsumption());
          //   default:
          //     return left(const CalendarFailure.response());
          // }
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.other:
          return left(const CalendarFailure.unknown());
      }
    }
  }

  /// Deletes an [Appointment] from the calendar.
  ///
  /// Returns a [CalendarFailure] if the [Appointment] fails to delete.
  Future<Either<CalendarFailure, Unit>> deleteAppointment(
    Appointment appointment,
  ) async {
    try {
      final dto = AppointmentDto.fromDomain(appointment);
      await _api.deleteAppointment(dto);

      final calendar = await _cache.readCalendar();

      if (calendar == null) {
        return right(unit);
      } else {
        await _cache.writeCalendar(
          calendar.copyWith(
            appointments: calendar.appointments
                .where((element) => element.id != dto.id)
                .toList(),
          ),
        );
      }

      return right(unit);
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.timeout());
        case DioErrorType.response:
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.other:
          return left(const CalendarFailure.unknown());
      }
    }
  }

  /// Deletes a [Measurement] from the calendar.
  ///
  /// Returns a [CalendarFailure] if the [Measurement] fails to delete.
  Future<Either<CalendarFailure, Unit>> deleteMeasurement(
    Measurement measurement,
  ) async {
    try {
      final dto = MeasurementDto.fromDomain(measurement);
      await _api.deleteMeasurement(dto);

      final calendar = await _cache.readCalendar();

      if (calendar == null) {
        return right(unit);
      } else {
        await _cache.writeCalendar(
          calendar.copyWith(
            measurements: calendar.measurements
                .where((element) => element.id != dto.id)
                .toList(),
          ),
        );
      }

      return right(unit);
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.timeout());
        case DioErrorType.response:
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.other:
          return left(const CalendarFailure.unknown());
      }
    }
  }

  /// Deletes a [Consumption] from the calendar.
  ///
  /// Returns a [CalendarFailure] if the [Consumption] fails to delete.
  Future<Either<CalendarFailure, Unit>> deleteConsumption(
    Consumption consumption,
  ) async {
    try {
      final dto = ConsumptionDto.fromDomain(consumption);
      await _api.deleteConsumption(dto);

      await _cache.deleteConsumption(dto);

      return right(unit);
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.timeout());
        case DioErrorType.response:
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.other:
          return left(const CalendarFailure.unknown());
      }
    }
  }

  /// Updates an [Appointment] in the calendar.
  ///
  /// Returns a [CalendarFailure] if the [Appointment] fails to update.
  Future<Either<CalendarFailure, Unit>> updateAppointment(
    Appointment appointment,
  ) async {
    try {
      final dto = AppointmentDto.fromDomain(appointment);
      await _api.updateAppointment(dto);

      final calendar = await _cache.readCalendar();

      if (calendar == null) {
        return right(unit);
      } else {
        await _cache.writeCalendar(
          calendar.copyWith(
            appointments: calendar.appointments
                .map((element) => element.id == dto.id ? dto : element)
                .toList(),
          ),
        );
      }

      return right(unit);
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.timeout());
        case DioErrorType.response:
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.other:
          return left(const CalendarFailure.unknown());
      }
    }
  }

  /// Updates a [Measurement] in the calendar.
  ///
  /// Returns a [CalendarFailure] if the [Measurement] fails to update.
  Future<Either<CalendarFailure, Unit>> updateMeasurement(
    Measurement measurement,
  ) async {
    try {
      final dto = MeasurementDto.fromDomain(measurement);
      await _api.updateMeasurement(dto);

      final calendar = await _cache.readCalendar();

      if (calendar == null) {
        return right(unit);
      } else {
        await _cache.writeCalendar(
          calendar.copyWith(
            measurements: calendar.measurements
                .map((element) => element.id == dto.id ? dto : element)
                .toList(),
          ),
        );
      }

      return right(unit);
    } on CalendarDioException catch (e) {
      switch (e.error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          return left(const CalendarFailure.timeout());
        case DioErrorType.response:
          return left(const CalendarFailure.response());
        case DioErrorType.cancel:
          return left(const CalendarFailure.cancel());
        case DioErrorType.other:
          return left(const CalendarFailure.unknown());
      }
    }
  }
}
