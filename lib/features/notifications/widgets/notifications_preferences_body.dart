import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:notifications/notifications.dart';

class NotificationsPreferencesBody extends ConsumerWidget {
  const NotificationsPreferencesBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationPreferences =
        ref.watch(notificationPreferencesControllerProvider);

    return AsyncValueWidget(
      value: notificationPreferences,
      builder: (preferences) {
        return Padding(
          padding: Sizes.mediumPadding,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final preference = Preferences.values[index];
              return ProviderScope(
                overrides: [
                  notificationPreferenceProvider.overrideWithValue(
                    NotificationPreference(name: preference.name),
                  )
                ],
                child: const NotificationPreferenceSwitch(),
              );
            },
            itemCount: Preferences.values.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        );
      },
    );
  }
}
