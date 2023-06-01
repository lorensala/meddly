import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/home/widgets/widgets.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/widgets/async_value_widget.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(calendarControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) {
          showSnackBar(context, err.toString());
        },
      );
    });

    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Sizes.mediumPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserGreetings(),
                  Spacer(),
                  NotificationsButton(),
                ],
              ),
            ),
            CalendarSupervisor(),
            CalendarDateAndDayIndicator(),
            CalendarDayList(),
            SizedBox(height: Sizes.medium),
            CalendarList(),
          ],
        ),
      ),
    );
  }
}

class CalendarSupervisor extends HookConsumerWidget {
  const CalendarSupervisor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(supervisorControllerProvider);
    final selected = ref.watch(selectedSupervisedProvider);
    final index = useState(0);

    return AsyncValueWidget(
      value: res,
      builder: (res) {
        final supervised = res.supervised;

        if (supervised.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: index.value == 0
                      ? null
                      : () {
                          if (index.value == 1) {
                            index.value = 0;
                            ref
                                .read(selectedSupervisedProvider.notifier)
                                .update(null);
                          } else {
                            index.value = index.value - 1;

                            ref
                                .read(selectedSupervisedProvider.notifier)
                                .update(supervised.first);
                          }
                        },
                  icon: const Icon(Icons.chevron_left_rounded),
                ),
                if (selected == null)
                  const Text('Mi Calendario')
                else
                  Expanded(
                    child: Text(
                      'Calendario de ${selected.firstName} ${selected.lastName}',
                      style: context.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                IconButton(
                  onPressed: index.value == supervised.length
                      ? null
                      : () {
                          index.value = index.value + 1;

                          ref
                              .read(selectedSupervisedProvider.notifier)
                              .update(supervised[index.value - 1]);
                        },
                  icon: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
