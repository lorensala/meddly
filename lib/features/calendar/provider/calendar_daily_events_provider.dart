import 'package:calendar/calendar.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/controller/controller.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_daily_events_provider.g.dart';

@riverpod
List<CalendarEvent> calendarDailyEvents(
  CalendarDailyEventsRef ref,
) {
  final selectedDate = ref.watch(calendarSelectedDateProvider);

  return ref.watch(calendarControllerProvider).maybeWhen(
        data: (res) {
          final events = <CalendarEvent>[];

          for (final appointment in res.appointments) {
            if (appointment.date.isSameDay(selectedDate)) {
              events.add(
                CalendarEvent.fromAppointment(
                  description: appointment.location ??
                      appointment.speciality?.name ??
                      '',
                  title: appointment.name,
                  date: appointment.date,
                  id: appointment.id!,
                ),
              );
            }
          }

          for (final consumption in res.consumptions) {
            if (consumption.date.isSameDay(selectedDate)) {
              events.add(
                CalendarEvent.fromConsumption(
                  title: consumption.consumed.toString(),
                  description:
                      consumption.realConsumptionDate.toIso8601String(),
                  id: consumption.medicineId,
                  date: consumption.date,
                ),
              );
            }
          }

          for (final measurement in res.measurements) {
            if (measurement.date.isSameDay(selectedDate)) {
              events.add(
                CalendarEvent.fromMeasurement(
                  id: measurement.id,
                  date: measurement.date,
                ),
              );
            }
          }

          return events;
        },
        orElse: () => [],
      );
}
