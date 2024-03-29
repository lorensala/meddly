import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';

class PredictionsDiseaseWrapSelected extends ConsumerWidget {
  const PredictionsDiseaseWrapSelected({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedResults = ref.watch(symptomPredictionControllerProvider);

    if (selectedResults.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: Sizes.small,
      children: selectedResults.map((e) {
        return const PredictionDiseaseWrapSelectedItem();
      }).toList(),
    );
  }
}
