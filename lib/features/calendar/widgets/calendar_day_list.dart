import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/calendar/provider/provider.dart';

class CalendarDayList extends HookConsumerWidget {
  const CalendarDayList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daysOfTheYear = ref.watch(allDaysOfYearProvider);
    final selectedDate = ref.watch(selectedDateProvider);

    final controller = usePageController(
      viewportFraction: 1 / 6,
      initialPage: daysOfTheYear.indexWhere(
        (date) => date.isSameDay(selectedDate),
      ),
    );

    return Container(
      color: context.colorScheme.background,
      height: 80,
      child: PageView.builder(
        onPageChanged: (index) {
          ref
              .read(selectedDateProvider.notifier)
              .update((state) => daysOfTheYear[index]);
        },
        controller: controller,
        itemCount: daysOfTheYear.length,
        itemBuilder: (context, index) {
          return CalendarDayAndStatusIndicator(
            date: daysOfTheYear[index],
            onTap: () {
              ref
                  .read(selectedDateProvider.notifier)
                  .update((state) => daysOfTheYear[index]);

              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          );
        },
      ),
    );
  }
}
