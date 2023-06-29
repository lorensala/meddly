import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/l10n/l10n.dart';

class NotificationsPreferencesPage extends StatelessWidget {
  const NotificationsPreferencesPage({super.key});

  static const routeName = 'notifications-preferences';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const NotificationsPreferencesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.notifications),
      ),
      body: const NotificationsPreferencesView(),
    );
  }
}

class NotificationsPreferencesView extends ConsumerWidget {
  const NotificationsPreferencesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(notificationPreferencesControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) {
          showSnackBar(context, err.toString());
        },
      );
    });

    return const NotificationsPreferencesBody();
  }
}
