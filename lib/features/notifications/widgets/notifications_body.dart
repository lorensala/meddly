import 'package:flutter/material.dart';
import 'package:meddly/features/notifications/bloc/bloc.dart';
import 'package:notifications/notifications.dart';

/// {@template notifications_body}
/// Body of the NotificationsPage.
///
/// Add what it does
/// {@endtemplate}
class NotificationsBody extends StatelessWidget {
  /// {@macro notifications_body}
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NotificationsBloc>();
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) => RefreshIndicator(
        onRefresh: () {
          bloc.add(const NotificationsEvent.fetchNotificationPreferences());
          return Future<void>.value();
        },
        child: ListView(
          children: NotificationPreference.values
              .map(
                (p) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(p.name),
                    Switch.adaptive(
                      onChanged: (bool value) {
                        value
                            ? bloc.add(
                                NotificationsEvent.addNotificationPreference(
                                  p,
                                ),
                              )
                            : bloc.add(
                                NotificationsEvent.removeNotificationPreference(
                                  p,
                                ),
                              );
                      },
                      value: state.notificationPreferences.contains(p),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
