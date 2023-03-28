import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/core/core.dart';

class CalendarListItem extends StatelessWidget {
  const CalendarListItem({
    super.key,
    required this.event,
  });

  final CalendarEvent event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.horizontalPadding,
      child: Row(
        children: [
          Text(
            event.date.toHoursAndMinutesString(),
          ),
          const SizedBox(width: Sizes.mediumSpacing),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(Sizes.borderRadius),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: Sizes.padding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title,
                            style: context.textTheme.titleMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: Sizes.smallSpacing),
                          Text(
                            event.description,
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: context.colorScheme.onSecondary
                                  .withOpacity(0.7),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          event.maybeMap(
                            fromConsumption: (c) {
                              return Column(
                                children: [
                                  const SizedBox(height: Sizes.mediumSpacing),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: c.consumed
                                          ? context.colorScheme.onSecondary
                                          : context.colorScheme.primary,
                                    ),
                                    onPressed: () {
                                      if (!c.consumed) {
                                        // context.read<CalendarBloc>().add(
                                        //       CalendarEvent.addConsumption(
                                        //         consumption: Consumption(
                                        //           realConsumptionDate:
                                        //               DateTime.now(),
                                        //           date: c.date,
                                        //           consumed: false,
                                        //           medicineId: c.id,
                                        //         ),
                                        //       ),
                                        //     );
                                      } else {
                                        // context.read<CalendarBloc>().add(
                                        //       CalendarEvent.deleteConsumption(
                                        //         consumption: Consumption(
                                        //           realConsumptionDate:
                                        //               DateTime.now(),
                                        //           date: c.date,
                                        //           consumed: true,
                                        //           medicineId: c.id,
                                        //         ),
                                        //       ),
                                        //     );
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (c.consumed)
                                          SvgPicture.asset(Assets.success),
                                        const SizedBox(
                                          width: Sizes.smallSpacing,
                                        ),
                                        Text(
                                          c.consumed
                                              ? 'Consumed at ${c.date.toHoursAndMinutesString()}'
                                              : 'Mark as consumed',
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                            orElse: () => const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
