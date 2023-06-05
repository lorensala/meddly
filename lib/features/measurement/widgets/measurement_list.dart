import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/widgets/widgets.dart';

class MeasurementList extends ConsumerWidget {
  const MeasurementList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final measurements = ref.watch(measurementControllerProvider);

    return AsyncValueWidget(
      value: measurements,
      builder: (measurements) {
        if (measurements.isEmpty) {
          return const EmptyContainer(message: 'No hay mediciones');
        }

        return ListView.builder(
          itemCount: measurements.length,
          itemBuilder: (context, index) {
            final measurement = measurements[index];

            return ProviderScope(
              overrides: [
                measurementProvider.overrideWithValue(measurement),
              ],
              child: const MeasurementListItem(),
            );
          },
        );
      },
    );
  }
}
