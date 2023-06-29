import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';

class PredictionSymptomsResultListItem extends ConsumerWidget {
  const PredictionSymptomsResultListItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(symptomSearchResultProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
      child: ElevatedButtonTheme(
        data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: context.colorScheme.onSecondary,
            backgroundColor: context.colorScheme.secondary,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.small),
            ),
          ),
        ),
        child: ElevatedButton(
          onPressed: () => ref
              .read(symptomPredictionControllerProvider.notifier)
              .add(result),
          child: Container(
            padding: const EdgeInsets.all(Sizes.medium),
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.colorScheme.secondary,
              borderRadius: BorderRadius.circular(Sizes.extraSmall),
              boxShadow: boxShadow(context),
            ),
            child: Text(result.description),
          ),
        ),
      ),
    );
  }
}
