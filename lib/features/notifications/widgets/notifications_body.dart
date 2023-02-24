import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/controller/notifications_controller.dart';
import 'package:notifications/notifications.dart';

import '../provider/provider.dart';

/// {@template notifications_body}
/// Body of the NotificationsPage.
///
/// Add what it does
/// {@endtemplate}
class NotificationsBody extends ConsumerWidget {
  /// {@macro notifications_body}
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationPreferences = ref.watch(notificationPreferencesProvider);

    return notificationPreferences.when(
      data: (preferences) {
        return Padding(
          padding: Sizes.padding,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final preference = NotificationPreference.values[index];
              return ProviderScope(overrides: [
                notificationPreferenceProvider.overrideWithValue(preference)
              ], child: NotificationPreferenceCard());
            },
            itemCount: NotificationPreference.values.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
          ),
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class NotificationPreferenceCard extends ConsumerWidget {
  const NotificationPreferenceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preference = ref.watch(notificationPreferenceProvider);
    final notifier = ref.watch(notificationsControllerProvider.notifier);
    final isLoading = ref.watch(notificationsControllerProvider).isLoading;
    final isOn =
        ref.watch(isNotificationPreferenceOnProvider(preference: preference));

    return Container(
      padding: Sizes.padding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            preference.name.capitalize(),
            style: context.textTheme.bodyLarge,
          ),
          const Spacer(),
          Switch.adaptive(
            onChanged: isLoading
                ? null
                : (bool value) {
                    value
                        ? notifier.addNotificationPreference(preference)
                        : notifier.deleteNotificationPreference(preference);
                  },
            value: isOn,
          )
        ],
      ),
    );
  }
}
