import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/notifications/bloc/bloc.dart';
import 'package:meddly/features/notifications/widgets/notifications_body.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:notifications/notifications.dart';

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
    return BlocProvider(
      create: (context) => NotificationsBloc(
        notificationsRepository: GetIt.I.get<NotificationsRepository>(),
      ),
      child: const Scaffold(
        body: NotificationsView(),
      ),
    );
  }
}

/// {@template notifications_view}
/// Displays the Body of NotificationsView
/// {@endtemplate}
class NotificationsView extends StatelessWidget {
  /// {@macro notifications_view}
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationsBloc, NotificationsState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  failure.maybeWhen(
                    notFound: () => context.l10n.notificationPreferenceNotFound,
                    alreadyExists: () =>
                        context.l10n.notificationPreferenceAlreadyExistsError,
                    doesNotExist: () =>
                        context.l10n.notificationPreferenceDoesNotExistError,
                    timeout: () => context.l10n.timeout,
                    sendTimeout: () => context.l10n.timeout,
                    receiveTimeout: () => context.l10n.timeout,
                    orElse: () => context.l10n.unknownError,
                  ),
                ),
              ),
            );
          },
        );
      },
      child: const NotificationsBody(),
    );
  }
}
