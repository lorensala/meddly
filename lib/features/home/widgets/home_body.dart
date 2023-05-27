import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/auth/auth.dart';
import 'package:meddly/features/calendar/widgets/widgets.dart';
import 'package:meddly/features/home/provider/provider.dart';
import 'package:meddly/features/home/widgets/widgets.dart';
import 'package:meddly/features/user/user.dart';

class HomeBody extends ConsumerWidget {
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
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(authControllerProvider.notifier).signOut();
                      ref.read(userControllerProvider.notifier).signOut();
                    },
                    child: const UserGreetings(),
                  ),
                  const Spacer(),
                  const NotificationsButton(),
                ],
              ),
            ),
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
