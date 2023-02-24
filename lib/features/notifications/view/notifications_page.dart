import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/notifications/notifications.dart';

/// {@template notifications_page}
/// A description for NotificationsPage
/// {@endtemplate}
class NotificationsPage extends StatelessWidget {
  /// {@macro notifications_page}
  const NotificationsPage({super.key});

  /// The static route for NotificationsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const NotificationsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NotificationsView(),
    );
  }
}

/// {@template notifications_view}
/// Displays the Body of NotificationsView
/// {@endtemplate}
class NotificationsView extends ConsumerWidget {
  /// {@macro notifications_view}
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(notificationsControllerProvider, (_, state) {
      state.whenOrNull(error: (err, _) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(err.toString()),
            ),
          );
      });
    });

    return const NotificationsBody();
  }
}
