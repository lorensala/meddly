import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';

class CalendarDayAndStatusIndicator extends StatelessWidget {
  const CalendarDayAndStatusIndicator({
    super.key,
    required this.date,
    required this.onTap,
  });

  final DateTime date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _DayText(date: date),
          const SizedBox(height: Sizes.smallSpacing),
          _StatusIndicator(date: date),
        ],
      ),
    );
  }
}

class _DayText extends StatelessWidget {
  const _DayText({
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date.day.toString(),
      style: context.textTheme.titleMedium,
    );
  }
}

class _StatusIndicator extends ConsumerWidget {
  const _StatusIndicator({
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.shrink();
    // final hasConsumedConsumption =
    //     ref.watch(hasConsumedConsumptionProvider(date: date));
    // return SizedBox(
    //   height: 40,
    //   width: 40,
    //   child: AnimatedContainer(
    //     duration: statusIndicatorDuration,
    //     decoration: BoxDecoration(
    //       color: hasConsumedConsumption
    //           ? context.colorScheme.primary
    //           : context.colorScheme.secondary,
    //       borderRadius: BorderRadius.circular(25),
    //     ),
    //   ),
    // );
  }
}
