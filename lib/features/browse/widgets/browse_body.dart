import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/router/provider/go_router_provider.dart';

class BrowseBody extends ConsumerWidget {
  const BrowseBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BrowseCard(
              title: 'Measurements',
              description: 'Measure your blood pressure, heart rate, and more.',
              vector: Vectors.measurements,
              onTap: () => ref
                  .read(goRouterProvider)
                  .push('${BrowsePage.routeName}/${MeasurementPage.routeName}'),
            ),
            const SizedBox(height: Sizes.medium),
            BrowseCard(
              title: 'Predictions',
              description: 'Predict your future health and wellness.',
              vector: Vectors.predictions,
              onTap: () =>
                  ref.read(goRouterProvider).push(PredictionsPage.routeName),
            ),
            const SizedBox(height: Sizes.medium),
            BrowseCard(
              title: 'Medicines',
              description:
                  'Register your medicines and get notified when to take them.',
              vector: Vectors.medicines,
              onTap: () => ref
                  .read(goRouterProvider)
                  .push('${BrowsePage.routeName}/${MedicinePage.routeName}'),
            ),
            const SizedBox(height: Sizes.medium),
            BrowseCard(
              title: 'Appointments',
              description: 'Schedule your appointments and get reminders.',
              vector: Vectors.appointments,
              onTap: () => ref
                  .read(goRouterProvider)
                  .push('${BrowsePage.routeName}/${AppointmentPage.routeName}'),
            ),
            const SizedBox(height: Sizes.medium),
            BrowseCard(
              title: 'Supervision',
              description: 'Supervise your loved ones and get notified.',
              vector: Vectors.supervision,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
