import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/measurement/measurement.dart';

/// {@template measurement_page}
/// A description for MeasurementPage
/// {@endtemplate}
class MeasurementPage extends StatelessWidget {
  /// {@macro measurement_page}
  const MeasurementPage({super.key});

  /// The static route for MeasurementPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MeasurementPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const MeasurementView(),
    );
  }
}

/// {@template measurement_view}
/// Displays the Body of MeasurementView
/// {@endtemplate}
class MeasurementView extends ConsumerWidget {
  /// {@macro measurement_view}
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
