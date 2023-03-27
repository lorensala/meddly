import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/home/widgets/widgets.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/features/setup/view/setup_page.dart';

class FeaturesList extends StatelessWidget {
  const FeaturesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: Sizes.horizontalPadding,
        children: [
          FeatureCard(
            name: 'Calendar',
            onPressed: () => Navigator.of(context).push(CalendarPage.route()),
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
            onPressed: () => Navigator.of(context).push(MedicinePage.route()),
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
          const SizedBox(width: Sizes.mediumSpacing),
          FeatureCard(
            name: 'Phone',
            onPressed: () => Navigator.of(context).push(PhonePage.route()),
          ),
          const SizedBox(width: Sizes.mediumSpacing),
          FeatureCard(
            name: 'Measurement',
            onPressed: () =>
                Navigator.of(context).push(MeasurementPage.route()),
          ),
          const SizedBox(width: Sizes.mediumSpacing),
          FeatureCard(
              onPressed: () =>
                  Navigator.of(context).push(AppointmentPage.route()),
              name: 'Appointments')
        ],
      ),
    );
  }
}
