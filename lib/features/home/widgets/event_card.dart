import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:meddly/features/home/home.dart';

class EventCard extends ConsumerWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(calendarEventProvider);

    return Container(
      width: 150,
      padding: Sizes.mediumPadding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 56,
                width: 56,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colorScheme.background,
                    borderRadius:
                        BorderRadius.circular(Sizes.mediumBorderRadius),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.medium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: context.textTheme.bodyLarge!.copyWith(
                  color: context.colorScheme.onSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: Sizes.small),
              Text(
                event.description.capitalize(),
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.onSecondary.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: Sizes.small),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(Assets.clockThree,
                          colorFilter: ColorFilter.mode(
                              context.colorScheme.onPrimary, BlendMode.srcIn),
                          height: 14),
                      const SizedBox(width: Sizes.small),
                      Text(
                        event.date.toHoursAndMinutesString(),
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
