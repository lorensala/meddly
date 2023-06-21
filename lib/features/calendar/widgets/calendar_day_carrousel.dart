import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';

class CalendarDayCarrousel extends HookConsumerWidget {
  const CalendarDayCarrousel({super.key});

  static const double _height = 108;
  static const Duration _duration = Duration(milliseconds: 300);
  static const double _viewportFraction = 0.15;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final daysOfTheYear = useMemoized(
      getAllDaysInYear,
      const [],
    );

    final controller = usePageController(
      viewportFraction: _viewportFraction,
      initialPage: daysOfTheYear.indexWhere(
        (date) => date.isSameDay(DateTime.now()),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onBackground.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      height: _height,
      child: PageView.builder(
        onPageChanged: (int page) {
          final date = daysOfTheYear[page];
          ref.read(calendarSelectedDateProvider.notifier).update(date);
        },
        controller: controller,
        itemCount: daysOfTheYear.length,
        itemBuilder: (context, index) {
          final date = daysOfTheYear[index];
          return ProviderScope(
            overrides: [
              calendarDateProvider.overrideWithValue(date),
            ],
            child: GestureDetector(
              onTap: () async {
                await controller.animateToPage(
                  index,
                  duration: _duration,
                  curve: Curves.easeInOut,
                );
                ref.read(calendarSelectedDateProvider.notifier).update(date);
              },
              child: const CalendarDayCarrouselItem(),
            ),
          );
        },
      ),
    );
  }
}
