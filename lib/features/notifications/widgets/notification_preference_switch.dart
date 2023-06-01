// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/features/user/user.dart';

class NotificationPreferenceSwitch extends HookConsumerWidget {
  const NotificationPreferenceSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preference = ref.watch(notificationPreferenceProvider);
    final notifier =
        ref.watch(notificationPreferencesControllerProvider.notifier);
    final isLoading =
        ref.watch(notificationPreferencesControllerProvider).isLoading;
    final initialState = ref.watch(
      notificationPreferencesControllerProvider.select(
        (s) => s.maybeWhen(
          orElse: () => false,
          data: (s) {
            final p = s.firstWhereOrNull((e) => e.name == preference.name);

            if (p == null) return false;

            return true;
          },
        ),
      ),
    );
    final isOn = useState(initialState);

    Text description() {
      final email = ref
          .watch(userControllerProvider.select((s) => s.asData?.value?.email));
      final phone = ref
          .watch(userControllerProvider.select((s) => s.asData?.value?.phone));

      return Text.rich(
        TextSpan(
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colorScheme.onSecondary.withOpacity(0.6),
          ),
          text: 'Enviar notificaciones a ',
          children: [
            TextSpan(
              text: preference.name == 'email' ? '$email' : '$phone',
              style: context.textTheme.bodySmall!.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  preference.name.capitalize(),
                  style: context.textTheme.titleSmall,
                ),
                description(),
              ],
            ),
          ),
          const SizedBox(width: Sizes.medium),
          IgnorePointer(
            ignoring: isLoading,
            child: Switch.adaptive(
              onChanged: (bool value) {
                if (value) {
                  isOn.value = true;
                  notifier.addNotificationPreference(preference);
                } else {
                  isOn.value = false;
                  notifier.deleteNotificationPreference(preference);
                }
              },
              value: isOn.value,
            ),
          )
        ],
      ),
    );
  }
}
