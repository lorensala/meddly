import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/notifications/notifications.dart';

class NotificationsPreferencesPage extends StatelessWidget {
  const NotificationsPreferencesPage({super.key});

  static const routeName = '/notifications-preferences';

  /// The static route for NotificationsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const NotificationsPreferencesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(err.toString()),
              ),
            );
        },
      );
    });

    return const NotificationsPreferencesBody();
  }
}
