// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/widgets/widgets.dart';

class MeasurementDetailPage extends ConsumerWidget {
  const MeasurementDetailPage(this.id, {super.key});

  final int id;

  static String routeName = 'measurement_detail';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final measurements = ref.watch(measurementControllerProvider);

    return AsyncValueWidget(
      value: measurements,
      builder: (measurements) {
        if (measurements.isEmpty) {
          return const SizedBox.shrink();
        }

        final measurement = measurements.firstWhereOrNull((m) => m.id == id);

        if (measurement == null) {
          return const SizedBox.shrink();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Measurement'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Valor: ${measurement.value}'),
                Text('Fecha: ${measurement.date}'),
                Text('Tipo: ${measurement.type}'),
                Text('Unidad: ${measurement.unit}'),
                Button(
                  onPressed: () {
                    ref
                        .read(measurementControllerProvider.notifier)
                        .deleteMeasurement(id);
                    Navigator.pop(context);
                  },
                  label: 'Delete',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
