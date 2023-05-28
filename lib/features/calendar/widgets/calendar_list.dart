// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/widgets/widgets.dart';

class CalendarList extends ConsumerWidget {
  const CalendarList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendar = ref.watch(calendarControllerProvider);

    return AsyncValueWidget(
      value: calendar,
      builder: (calendar) {
        final calendarDailyEvents = ref.watch(calendarDailyEventsProvider);

        if (calendarDailyEvents.isEmpty) {
          return const EmptyContainer(
            message: 'No hay eventos para el día seleccionado',
            isFlex: false,
          );
        }

        return ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(height: Sizes.medium),
          itemCount: calendarDailyEvents.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CalendarListItem(
              event: calendarDailyEvents[index],
            );
          },
        );
      },
    );
  }
}
