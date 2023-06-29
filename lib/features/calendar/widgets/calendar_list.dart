// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/calendar/controller/consumption_controller.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class CalendarList extends ConsumerWidget {
  const CalendarList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendar = ref.watch(calendarControllerProvider);

    return AsyncValueWidget(
      value: calendar,
      loading: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: Sizes.medium),
        itemCount: 3,
        padding: const EdgeInsets.symmetric(vertical: Sizes.medium),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const CalendarListItemShimmered();
        },
      ),
      builder: (calendar) {
        final calendarDailyEvents = ref.watch(calendarDailyEventsProvider);

        if (calendarDailyEvents.isEmpty) {
          return EmptyContainer(
            message: context.l10n.calendarNoEventsForSelectedDay,
            isFlex: false,
          );
        }

        return Expanded(
          child: ListView.separated(
            separatorBuilder: (_, __) => const SizedBox(height: Sizes.medium),
            itemCount: calendarDailyEvents.length,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: Sizes.medium),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProviderScope(
                overrides: [
                  calendarEventProvider.overrideWithValue(
                    calendarDailyEvents[index],
                  ),
                  consumptionControllerProvider
                      .overrideWith(ConsumptionController.new)
                ],
                child: const CalendarListItem(),
              );
            },
          ),
        );
      },
    );
  }
}
