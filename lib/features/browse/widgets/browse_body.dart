import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/widgets/widgets.dart';

class BrowseBody extends StatelessWidget {
  const BrowseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              onTap: () {},
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
