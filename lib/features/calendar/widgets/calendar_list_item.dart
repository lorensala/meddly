import 'dart:math' as math;

import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/widgets/widgets.dart';

class CalendarListItem extends StatelessWidget {
  const CalendarListItem({
    required this.event,
    super.key,
  });

  final CalendarEvent event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.horizontalPadding,
      child: Row(
        children: [
          SizedBox(
            width: Sizes.large * 2,
            child: Text(
              event.date.toHoursAndMinutesString(),
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onBackground.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(width: Sizes.medium),
          Expanded(
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.zero,
                    ),
                  ),
              onPressed: () {},
              child: DecoratedBox(
                decoration: BoxDecoration(
                  boxShadow: boxShadow(context),
                  color: context.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
                ),
                child: ListTile(
                  minLeadingWidth: 10,
                  leading: SizedBox(
                    height: double.infinity,
                    width: Sizes.large,
                    child: switch (event) {
                      MedicineEvent() => Transform.rotate(
                          angle: math.pi / 4,
                          child: SvgPicture.asset(
                            Vectors.medicine,
                            colorFilter: ColorFilter.mode(
                              context.colorScheme.onBackground,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      AppointmentEvent() => SvgPicture.asset(
                          Vectors.appointment,
                          colorFilter: ColorFilter.mode(
                            context.colorScheme.onBackground,
                            BlendMode.srcIn,
                          ),
                        ),
                      MeasurementEvent() => SvgPicture.asset(
                          Vectors.measurement,
                          colorFilter: ColorFilter.mode(
                            context.colorScheme.onBackground,
                            BlendMode.srcIn,
                          ),
                        ),
                    },
                  ),
                  title: Text(event.title),
                  trailing: SizedBox(
                    height: double.infinity,
                    child: Tooltip(
                      message: 'Ignacio Pieve',
                      child: CircleAvatar(
                        backgroundColor: context.colorScheme.primary,
                        radius: 10,
                        child: Text(
                          'IP',
                          style: context.textTheme.bodySmall!.copyWith(
                            color: context.colorScheme.background,
                          ),
                        ),
                      ),
                    ),
                  ),
                  subtitle: switch (event) {
                    MedicineEvent(
                      :final uid,
                      :final consumed,
                      :final id,
                      :final date
                    ) =>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event.description),
                          const SizedBox(height: Sizes.small),
                          Consumer(
                            builder: (context, ref, child) {
                              final user = ref.watch(userProvider);

                              if (user == null) {
                                return const SizedBox();
                              }

                              if (uid != user.uid) {
                                return const SizedBox();
                              }

                              return Button(
                                onPressed: () {
                                  if (!consumed) {
                                    ref
                                        .read(
                                          calendarControllerProvider.notifier,
                                        )
                                        .addConsumption(
                                          Consumption(
                                            realConsumptionDate: DateTime.now(),
                                            date: date,
                                            consumed: true,
                                            medicineId: id,
                                          ),
                                        );
                                  } else {
                                    ref
                                        .read(
                                          calendarControllerProvider.notifier,
                                        )
                                        .addConsumption(
                                          Consumption(
                                            realConsumptionDate: DateTime.now(),
                                            date: date,
                                            consumed: false,
                                            medicineId: id,
                                          ),
                                        );
                                  }
                                },
                                label: consumed
                                    ? 'Consumed at ${date.toHoursAndMinutesString()}'
                                    : 'Mark as consumed',
                              );
                            },
                          ),
                        ],
                      ),
                    _ => Text(event.description)
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
