import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/widgets/widgets.dart';
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
            BrowseItem(
              title: 'Measurements',
              description: 'Measure your blood pressure, heart rate, and more.',
              vector: Vectors.measurements,
              onTap: () {},
            ),
            const SizedBox(height: Sizes.medium),
            BrowseItem(
              title: 'Predictions',
              description: 'Predict your future health and wellness.',
              vector: Vectors.predictions,
              onTap: () =>
                  ref.read(goRouterProvider).push(PredictionsPage.routeName),
            ),
            const SizedBox(height: Sizes.medium),
            BrowseItem(
              title: 'Medicines',
              description:
                  'Register your medicines and get notified when to take them.',
              vector: Vectors.medicines,
              onTap: () {},
            ),
            const SizedBox(height: Sizes.medium),
            BrowseItem(
              title: 'Appointments',
              description: 'Schedule your appointments and get reminders.',
              vector: Vectors.appointments,
              onTap: () {},
            ),
            const SizedBox(height: Sizes.medium),
            BrowseItem(
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
