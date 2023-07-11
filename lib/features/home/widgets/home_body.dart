import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/home/widgets/widgets.dart';
import 'package:meddly/features/supervisor/controller/controller.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen(calendarControllerProvider, (_, state) {
        state.whenOrNull(
          error: (err, _) {
            showSnackBar(context, err.toString());
          },
        );
      })
      ..listen(supervisorControllerProvider, (_, state) {
        state.whenOrNull(
          error: (err, _) {
            showSnackBar(context, err.toString());
          },
        );
      });

    return const SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(Sizes.medium),
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
          CalendarIndicator(),
          CalendarDayCarrousel(),
          CalendarList(),
        ],
      ),
    );
  }
}
