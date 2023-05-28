import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';

class CalendarDayListItem extends ConsumerWidget {
  const CalendarDayListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(calendarDateProvider);

    final isToday = date.isToday();

    return GestureDetector(
      onTap: () {
        ref.read(calendarSelectedDateProvider.notifier).update(date);
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: Sizes.small),
        padding: const EdgeInsets.all(Sizes.small),
        decoration: BoxDecoration(
          color: isToday
              ? context.colorScheme.primary
              : context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.extraLarge),
        ),
        duration: const Duration(milliseconds: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date.toNamedDayString(context).substring(0, 1).capitalize(),
              style: context.textTheme.bodyMedium!.copyWith(
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
    );
  }
}
