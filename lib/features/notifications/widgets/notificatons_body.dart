import 'package:flutter/material.dart';
import 'package:meddly/features/notifications/notifications.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NotificationsChipWrap(),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const NotificationListItem();
              },)
        ],
      ),
    );
  }
}
