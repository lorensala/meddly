import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';

class CalendarDayList extends HookConsumerWidget {
  const CalendarDayList({super.key});

  static const double _height = 75;
  static const Duration _duration = Duration(milliseconds: 300);
  static const double _viewportFraction = 0.15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daysOfTheYear = ref.watch(calendarDaysProvider);

    useMemoized(() => daysOfTheYear);

    final controller = usePageController(
      viewportFraction: _viewportFraction,
      initialPage: daysOfTheYear.indexWhere(
        (date) => date.isSameDay(DateTime.now()),
      ),
    );

    ref.listen(calendarSelectedDateProvider, (_, date) async {
      await controller.animateToPage(
        daysOfTheYear.indexWhere((d) => d.isSameDay(date)),
        duration: _duration,
        curve: Curves.easeInOut,
      );
    });

    return Container(
      color: context.colorScheme.background,
      height: _height,
      child: PageView.builder(
        onPageChanged: (_) {},
        controller: controller,
        itemCount: daysOfTheYear.length,
        itemBuilder: (context, index) {
          final date = daysOfTheYear[index];
          return ProviderScope(
            overrides: [
              calendarDateProvider.overrideWithValue(date),
            ],
            child: const CalendarDayListItem(),
          );
        },
      ),
    );
  }
}
