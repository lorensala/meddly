// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CalendarList extends ConsumerWidget {
  const CalendarList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox.shrink();
    // final calendarEvents = ref.watch(calendarEventsProvider);
    // final selectedDate = ref.watch(selectedDateProvider);

    // if (calendarEvents.isEmpty) return const SizedBox.shrink();

    // final filteredEvents = calendarEvents
    //     .where(
    //       (event) => event.date.isSameDay(selectedDate),
    //     )
    //     .toList();

    // return Expanded(
    //   flex: 2,
    //   child: ColoredBox(
    //     color: context.colorScheme.background,
    //     child: RefreshIndicator(
    //       onRefresh: () async {
    //         ref.read(calendarControllerProvider.notifier).refresh();
    //       },
    //       child: ListView.separated(
    //         separatorBuilder: (_, __) =>
    //             const SizedBox(height: Sizes.mediumSpacing),
    //         itemCount: filteredEvents.length,
    //         itemBuilder: (context, index) {
    //           return CalendarListItem(
    //             event: filteredEvents[index],
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
