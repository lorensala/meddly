import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/widgets/widgets.dart';
import 'package:meddly/features/home/provider/provider.dart';
import 'package:meddly/features/home/widgets/widgets.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends ConsumerWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Sizes.mediumPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  UserGreetings(),
                  Spacer(),
                  NotificationsButton(),
                ],
              ),
            ),
            Container(),
            const CalendarDateAndDayIndicator(),
            const CalendarDayList(),
            const SizedBox(height: Sizes.medium),
            const CalendarList(),
          ],
        ),
      ),
    );
  }
}
