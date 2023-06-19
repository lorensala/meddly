import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MeasurementList extends ConsumerWidget {
  const MeasurementList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final measurements = ref.watch(measurementControllerProvider);
    final filteredMeasurements = ref.watch(filteredMeasurementsProvider);

    return AsyncValueWidget(
      value: measurements,
      builder: (measurements) {
        if (measurements.isEmpty) {
          return EmptyContainer(
            message: context.l10n.emptyMeasurements,
            isFlex: false,
          );
        }

        if (filteredMeasurements.isEmpty) {
          return EmptyContainer(
            message: context.l10n.emptyFilteredMeasurements,
            isFlex: false,
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: filteredMeasurements.length,
          itemBuilder: (context, index) {
            final measurement = filteredMeasurements[index];

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
