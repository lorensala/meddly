import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';

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

class _StatusIndicator extends StatelessWidget {
  const _StatusIndicator({
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          final hasConsumedConsumption = state.hasConsumedConsumption(date);

          return AnimatedContainer(
            duration: statusIndicatorDuration,
            decoration: BoxDecoration(
              color: hasConsumedConsumption
                  ? context.colorScheme.primary
                  : context.colorScheme.secondary,
              borderRadius: BorderRadius.circular(25),
            ),
          );
        },
      ),
    );
  }
}
