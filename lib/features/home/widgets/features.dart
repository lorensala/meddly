import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/features/setup/view/setup_page.dart';

import '../../medicine/medicine.dart';

class Features extends StatelessWidget {
  const Features({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Features',
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(height: Sizes.mediumSpacing),
        SizedBox(
          height: 150,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              FeatureCard(
                name: 'Calendar',
                onPressed: () =>
                    Navigator.of(context).push(CalendarPage.route()),
              ),
              const SizedBox(width: Sizes.mediumSpacing),
              FeatureCard(
                name: 'Predictions',
                onPressed: () =>
                    Navigator.of(context).push(PredictionsPage.route()),
              ),
              const SizedBox(width: Sizes.mediumSpacing),
              FeatureCard(
                name: 'Medicine',
                onPressed: () =>
                    Navigator.of(context).push(MedicinePage.route()),
              ),
              const SizedBox(width: Sizes.mediumSpacing),
              FeatureCard(
                name: 'Setup',
                onPressed: () => Navigator.of(context).push(SetupPage.route()),
              ),
              const SizedBox(width: Sizes.mediumSpacing),
              FeatureCard(
                name: 'Notifications',
                onPressed: () =>
                    Navigator.of(context).push(NotificationsPage.route()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.onPressed,
    required this.name,
  });

  final VoidCallback onPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.borderRadius),
        ),
        child: Padding(
          padding: Sizes.padding,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.background,
                    borderRadius: BorderRadius.circular(Sizes.borderRadius),
                  ),
                ),
                Text(name)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
