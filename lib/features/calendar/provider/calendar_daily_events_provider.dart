// ignore_for_file: lines_longer_than_80_chars, depend_on_referenced_packages

import 'package:calendar/calendar.dart';
import 'package:collection/collection.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/core/core.dart';
import 'package:meddly/features/calendar/controller/controller.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_daily_events_provider.g.dart';

@riverpod
List<CalendarEvent> calendarDailyEvents(
  CalendarDailyEventsRef ref,
) {
  final selectedDate = ref.watch(calendarSelectedDateProvider);
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return ref.watch(calendarControllerProvider).maybeWhen(
        data: (usersCalendarList) {
          final events = <CalendarEvent>[];

          for (final userCalendar in usersCalendarList) {
            final userCalendarEvents = <CalendarEvent>[];

            userCalendar.forEach((String uid, Calendar calendar) {
              for (final appointment in calendar.appointments) {
                if (appointment.date.isSameDay(selectedDate)) {
                  userCalendarEvents.add(
                    AppointmentEvent(
                      id: appointment.id ?? 0,
                      uid: uid,
                      title: appointment.name,
                      description:
                          appointment.speciality!.localizedString(l10n),
                      date: appointment.date,
                    ),
                  );
                }
              }

              for (final measurement in calendar.measurements) {
                if (measurement.date.isSameDay(selectedDate)) {
                  userCalendarEvents.add(
                    MeasurementEvent(
                      id: measurement.id,
                      uid: uid,
                      title: measurement.value.toString(),
                      description: measurement.type.localizedString(l10n),
                      date: measurement.date,
                    ),
                  );
                }
              }

              for (final consumption in calendar.consumptions) {
                if (consumption.date.isSameDay(selectedDate)) {
                  final medicine = calendar.medicines
                      .firstWhereOrNull((m) => m.id == consumption.medicineId);

                  if (medicine != null) {
                    final title =
                        '${medicine.name} ${medicine.dosis.truncate()}${medicine.dosisUnit.name}';

                    final unitsLeft = medicine.stock == null
                        ? ''
                        : medicine.stock! > 0
                            ? '${medicine.stock} ${l10n.unitsLeft}'
                            : l10n.noUnitsLeft;

                    final note = medicine.instructions == null
                        ? ''
                        : medicine.instructions!.isNotEmpty
                            ? '\n${medicine.instructions!}'
                            : '';

                    userCalendarEvents.add(
                      MedicineEvent(
                        id: consumption.medicineId,
                        uid: uid,
                        title: title,
                        description: unitsLeft + note,
                        date: consumption.date,
                        consumed: consumption.consumed,
                        consumedDate: consumption.realConsumptionDate,
                      ),
                    );
                  }
                }
              }
            });

            events.addAll(userCalendarEvents);
          }

          events.sort((a, b) {
            final date = a.date.compareTo(b.date);
            if (date != 0) {
              return date;
            }
            return a.uid.compareTo(b.uid);
          });

          return events;
        },
        orElse: () => [],
      );
}
