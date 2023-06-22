import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionsButton extends ConsumerWidget {
  const PredictionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(
      symptomPredictionControllerProvider.select((value) => value.isNotEmpty),
    );
    final isLoading = ref
        .watch(
          predictionControllerProvider,
        )
        .isLoading;

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: () =>
          ref.read(symptomPredictionControllerProvider.notifier).predict(),
      label: 'Consultar',
    );
  }
}
