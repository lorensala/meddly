import 'package:calendar/calendar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:meddly/features/calendar/bloc/bloc.dart';

class CalendarList extends StatelessWidget {
  const CalendarList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Empty')),
          loading: () => const Center(
            child: RepaintBoundary(child: CircularProgressIndicator()),
          ),
          success: (calendar) {
            final activeMedicines = calendar.value1;
            final appointments = calendar.value2;
            final measurements = calendar.value3;
            final consumptions = calendar.value4;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<CalendarBloc>().add(
                      const CalendarEvent.fetchAll(),
                    );
              },
              child: ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: consumptions.length +
                    appointments.length +
                    measurements.length,
                itemBuilder: (context, index) {
                  if (index < consumptions.length) {
                    final consumption = consumptions[index];
                    final medicineAssociatedWithConsumption =
                        activeMedicines.firstWhereOrNull(
                      (medicine) => medicine.id == consumption.medicineId,
                    );
                    final event = Event.fromConsumption(
                      id: consumption.medicineId,
                      date: consumption.date,
                      title: medicineAssociatedWithConsumption?.name ?? '',
                      description:
                          medicineAssociatedWithConsumption?.presentation ?? '',
                      consumed: consumption.consumed,
                    );

                    return ListTile(
                      title: Text(event.title),
                      subtitle: Text(event.description),
                      leading: Text(
                        '${event.date.hour.toString().padLeft(2, '0')}:${event.date.minute.toString().padLeft(2, '0')}',
                      ),
                      trailing: event.mapOrNull(
                        fromConsumption: (c) {
                          return Checkbox(
                            value: c.consumed,
                            onChanged: (value) {
                              if (value!) {
                                context.read<CalendarBloc>().add(
                                      CalendarEvent.addConsumption(
                                        consumption: consumption.copyWith(
                                          realConsumptionDate: DateTime.now(),
                                        ),
                                      ),
                                    );
                              } else {
                                context.read<CalendarBloc>().add(
                                      CalendarEvent.deleteConsumption(
                                        consumption: consumption.copyWith(
                                          realConsumptionDate: DateTime.now(),
                                        ),
                                      ),
                                    );
                              }
                            },
                          );
                        },
                      ),
                    );
                  } else if (index <
                      consumptions.length + appointments.length) {
                    return ListTile(
                      title: Text(
                        appointments[index - consumptions.length].name,
                      ),
                      subtitle: Text(
                        appointments[index - consumptions.length]
                            .doctor
                            .toString(),
                      ),
                    );
                  } else {
                    return ListTile(
                      title: Text(
                        measurements[index -
                                consumptions.length -
                                appointments.length]
                            .type,
                      ),
                      subtitle: Text(
                        measurements[index -
                                consumptions.length -
                                appointments.length]
                            .value
                            .toString(),
                      ),
                    );
                  }
                },
              ),
            );
          },
          failure: (failure) => Center(child: Text(failure.toString())),
        );
      },
    );
  }
}
