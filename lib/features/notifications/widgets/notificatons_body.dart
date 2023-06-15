import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationsFilters(),
          SizedBox(height: Sizes.small),
          NotificationsList(),
        ],
      ),
    );
  }
}

class NotificationsList extends ConsumerWidget {
  const NotificationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsControllerProvider);
    final filteredNotifications = ref.watch(filteredNotificationsProvider);

    return AsyncValueWidget(
      value: notifications,
      builder: (notifications) {
        if (notifications.isEmpty) {
          return EmptyContainer(
            message: context.l10n.emptyNotifications,
            isFlex: false,
          );
        }

        if (filteredNotifications.isEmpty) {
          return EmptyContainer(
            message: context.l10n.emptyFilteredNotifications,
            isFlex: false,
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: filteredNotifications.length,
          itemBuilder: (context, index) {
            return ProviderScope(
              overrides: [
                notificationProvider
                    .overrideWithValue(filteredNotifications[index]),
              ],
              child: const NotificationListItem(),
            );
          },
        );
      },
    );
  }
}
