import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/router/provider/go_router_provider.dart';

class MeasurementPage extends ConsumerWidget {
  const MeasurementPage({super.key});

  static String routeName = 'measurement';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mediciones'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(goRouterProvider).go(
              '${BrowsePage.routeName}/${MeasurementPage.routeName}/${MeasurementFormPage.routeName}',
            ),
        tooltip: 'Añadir medición',
        child: const Icon(Icons.add),
      ),
      body: const MeasurementView(),
    );
  }
}

class MeasurementView extends ConsumerWidget {
  const MeasurementView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(measurementControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(err.toString()),
            ),
          );
        },
      );
    });

    return const MeasurementBody();
  }
}
