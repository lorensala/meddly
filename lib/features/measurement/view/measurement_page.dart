import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';

class MeasurementPage extends ConsumerWidget {
  const MeasurementPage({super.key});

  static String routeName = 'measurement';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: context.colorScheme.onBackground.withOpacity(0.2),
        title: Text(context.l10n.measurements),
        actions: const [
          MeasurementFilter(),
        ],
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
          showSnackBar(context, err.toString());
        },
      );
    });

    return const MeasurementList();
  }
}
