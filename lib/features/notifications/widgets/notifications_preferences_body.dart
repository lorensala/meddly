import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:notifications/notifications.dart';

class NotificationsPreferencesBody extends ConsumerWidget {
  const NotificationsPreferencesBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationPreferences =
        ref.watch(notificationPreferencesStreamProvider);

    return notificationPreferences.when(
      data: (preferences) {
        return Padding(
          padding: Sizes.mediumPadding,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final preference = NotificationPreference.values[index];
              return ProviderScope(overrides: [
                notificationPreferenceProvider.overrideWithValue(preference)
              ], child: const NotificationPreferenceCard(),);
            },
            itemCount: NotificationPreference.values.length,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: Sizes.medium,
            ),
          ),
        );
      },
      error: (error, _) {
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
      padding: Sizes.mediumPadding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
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
