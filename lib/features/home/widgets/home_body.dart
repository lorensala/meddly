import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/home/widgets/widgets.dart';

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
            CalendarIndicator(),
            CalendarDayCarrousel(),
            SizedBox(height: Sizes.medium),
            CalendarList(),
            SizedBox(height: Sizes.medium),
          ],
        ),
      ),
    );
  }
}
