// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';

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
          text: '${context.l10n.sendNotificationsTo} ',
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

    return ListTile(
      title: Text(
        preference.name.capitalize(),
        style: context.textTheme.titleSmall,
      ),
      subtitle: description(),
      trailing: IgnorePointer(
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
      ),
    );
  }
}
