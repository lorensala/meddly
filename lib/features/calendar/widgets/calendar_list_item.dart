import 'package:calendar/calendar.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/calendar/controller/consumption_controller.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class CalendarListItem extends StatelessWidget {
  const CalendarListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.medium),
      child: Row(
        children: [
          _EventHour(),
          SizedBox(width: Sizes.medium),
          _EventCard(),
        ],
      ),
    );
  }
}

class _EventCard extends ConsumerWidget {
  const _EventCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(calendarEventProvider);
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: boxShadow(context),
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.small),
        ),
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          minVerticalPadding: 16,
          minLeadingWidth: 1,
          isThreeLine: switch (event) {
            MedicineEvent() => true,
            _ => false,
          },
          leading: const _EventLeading(),
          title: Text(event.title),
          subtitle: const _EventSubtitle(),
        ),
      ),
    );
  }
}

class _EventSubtitle extends ConsumerWidget {
  const _EventSubtitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(calendarEventProvider);
    final notifier = ref.watch(consumptionControllerProvider.notifier);
    final isLoading = ref.watch(consumptionControllerProvider).isLoading;
    final isCalendarLoading = ref.watch(calendarControllerProvider).isLoading;

    return switch (event) {
      MedicineEvent(
        :final uid,
        :final consumed,
        :final id,
        :final date,
        :final consumedDate
      ) =>
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.description,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final user = ref.watch(userProvider);

                if (user == null) {
                  return const SizedBox();
                }

                if (uid != user.uid) {
                  return const SizedBox();
                }

                return Column(
                  children: [
                    const SizedBox(height: Sizes.small),
                    IgnorePointer(
                      ignoring: isLoading || isCalendarLoading,
                      child: Button(
                        elevation: 2,
                        isValid: !consumed,
                        isLoading: isLoading,
                        onPressed: () {
                          if (!consumed) {
                            notifier.addConsumption(
                              Consumption(
                                realConsumptionDate: DateTime.now(),
                                date: date,
                                consumed: true,
                                medicineId: id,
                              ),
                            );
                          } else {
                            notifier.addConsumption(
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
                            ? '${context.l10n.consumedAt} ${consumedDate?.toHoursAndMinutesString()}'
                            : context.l10n.markAsConsumed,
                      ),
                    ),
                  ],
                );
              },
            ),
            const _EventUser(),
          ],
        ),
      _ => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.description,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            const _EventUser(),
          ],
        ),
    };
  }
}

class _EventUser extends ConsumerWidget {
  const _EventUser();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(calendarEventProvider);
    final user = ref.watch(
      calendarUsersProvider
          .select((value) => value.firstWhereOrNull((u) => u.uid == event.uid)),
    );
    final me = ref.watch(userProvider);

    if (user == null) {
      return const SizedBox.shrink();
    }

    if (user.uid == me?.uid) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        const SizedBox(height: Sizes.medium),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: context.colorScheme.primary,
              radius: 13,
              child: Text(
                '${user.firstName[0]}${user.lastName[0]}',
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.colorScheme.background,
                ),
              ),
            ),
            const SizedBox(width: Sizes.small),
            Text('${user.firstName} ${user.lastName}'),
          ],
        ),
      ],
    );
  }
}

class _EventLeading extends ConsumerWidget {
  const _EventLeading();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(calendarEventProvider);
    return SizedBox(
      height: double.infinity,
      width: Sizes.large,
      child: switch (event) {
        MedicineEvent() => SvgPicture.asset(
            Vectors.medicine,
            colorFilter: ColorFilter.mode(
              context.colorScheme.onBackground,
              BlendMode.srcIn,
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
    );
  }
}

class _EventHour extends ConsumerWidget {
  const _EventHour();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(calendarEventProvider);
    return SizedBox(
      width: Sizes.large * 2,
      child: Text(
        event.date.toHoursAndMinutesString(),
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.onBackground,
        ),
      ),
    );
  }
}
