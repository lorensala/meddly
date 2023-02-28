import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/measurement/measurement.dart';

/// {@template measurement_body}
/// Body of the MeasurementPage.
///
/// Add what it does
/// {@endtemplate}
class MeasurementBody extends ConsumerWidget {
  /// {@macro measurement_body}
  const MeasurementBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MeasurementForm();
  }
}
