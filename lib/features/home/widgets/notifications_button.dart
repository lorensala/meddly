import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';

class NotificationsButton extends ConsumerWidget {
  const NotificationsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.watch(calendarRepositoryProvider).fetchCalendar(),
      child: SizedBox(
        height: 56,
        width: 56,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            borderRadius: BorderRadius.circular(Sizes.borderRadius),
          ),
          child: Center(
              child: SvgPicture.asset(
            Assets.notificationsIcon,
            width: 24,
            height: 24,
          )),
        ),
      ),
    );
  }
}
