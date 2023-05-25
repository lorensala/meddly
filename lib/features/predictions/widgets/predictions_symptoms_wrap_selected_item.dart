import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';

class PredictionSymptomsWrapSelectedItem extends ConsumerWidget {
  const PredictionSymptomsWrapSelectedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(symptomSelectedProvider);

    return Chip(
      backgroundColor: context.colorScheme.primary.withOpacity(0.25),
      label: Text(selected.description),
      deleteIcon: Icon(
        Icons.close,
        size: 16,
        color: context.colorScheme.primary,
      ),
      deleteButtonTooltipMessage: 'Remove',
      onDeleted: () => ref
          .read(symptomPredictionControllerProvider.notifier)
          .remove(selected),
    ).animate().fadeIn(
          duration: const Duration(milliseconds: 100),
        );
  }
}
