import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';

class CalendarDayCarrouselItem extends HookConsumerWidget {
  const CalendarDayCarrouselItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(calendarDateProvider);
    final selectedDate = ref.watch(calendarSelectedDateProvider);
    final isToday = date.isToday();
    final isSelected = selectedDate.isSameDay(date);

    return Column(
      children: [
        AnimatedContainer(
          width: 42,
          margin: const EdgeInsets.symmetric(
            horizontal: Sizes.small,
            vertical: Sizes.small,
          ),
          padding: const EdgeInsets.all(Sizes.small),
          decoration: BoxDecoration(
            boxShadow: !isSelected ? null : boxShadow(context),
            color: isToday
                ? context.colorScheme.primary
                : context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(Sizes.extraLarge),
          ),
          duration: const Duration(milliseconds: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                date.toNamedDayString(context).substring(0, 1).capitalize(),
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isToday
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.onSecondary,
                ),
              ),
              const SizedBox(height: Sizes.medium),
              Text(
                date.day.toString(),
                style: context.textTheme.bodyMedium!.copyWith(
                  color: isToday
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
        const _CalendarDayCarrouselItemStatusIndicator(),
      ],
    );
  }
}

class _CalendarDayCarrouselItemStatusIndicator extends ConsumerWidget {
  const _CalendarDayCarrouselItemStatusIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(calendarDateProvider);
    final hasEvents = ref.watch(calendarHasEventsProvider(date: date));
    final hasAllConsumed =
        ref.watch(calendarHasAllConsumedProvider(date: date));

    if (!hasEvents) return const SizedBox.shrink();

    return CircleAvatar(
      radius: Sizes.extraSmall - 1,
      backgroundColor: hasAllConsumed
          ? context.colorScheme.primary
          : context.colorScheme.onBackground,
    );
  }
}
