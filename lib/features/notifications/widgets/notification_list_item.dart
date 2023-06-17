import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:notifications/notifications.dart';

class NotificationListItem extends ConsumerWidget {
  const NotificationListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notification = ref.watch(notificationProvider);

    return Dismissible(
      direction: DismissDirection.endToStart,
      background: ColoredBox(
        color: context.colorScheme.error,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: Sizes.medium),
            child: SvgPicture.asset(
              Vectors.trash,
            ),
          ),
        ),
      ),
      key: const Key('notification'),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          ref.read(notificationsControllerProvider.notifier).delete(
                notification,
              );
        }
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.medium,
          vertical: Sizes.small,
        ),
        selected: !notification.isRead,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        tileColor: context.colorScheme.secondary,
        leading: SvgPicture.asset(
          switch (notification.type) {
            NotificationType.appointment => Vectors.appointment,
            NotificationType.medicine => Vectors.medicine,
            NotificationType.supervisors => Vectors.linkedAccount,
          },
          colorFilter: ColorFilter.mode(
            context.colorScheme.onBackground,
            BlendMode.srcIn,
          ),
        ),
        titleAlignment: ListTileTitleAlignment.center,
        minLeadingWidth: 0,
        title: Text(
          notification.title,
          style: context.textTheme.titleMedium,
        ),
        subtitle: Text(
          notification.body,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSecondary.withOpacity(0.5),
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(
          notification.createdAt.toHoursAndMinutesString(),
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSecondary.withOpacity(0.5),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
