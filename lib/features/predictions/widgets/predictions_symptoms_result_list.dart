import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionSymptomsResultList extends ConsumerWidget {
  const PredictionSymptomsResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(symptomSearchResultsProvider);

    return AsyncValueWidget(
      value: results,
      builder: (results) {
        if (results.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Text(
              context.l10n.predictionsSearchNoResults,
              style: context.textTheme.titleMedium!.copyWith(
                color: context.colorScheme.onSecondary.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return ListView.separated(
          itemCount: results.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: Sizes.medium),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final result = results[index];
            return ProviderScope(
              overrides: [
                symptomSearchResultProvider.overrideWithValue(result),
              ],
              child: const PredictionSymptomsResultListItem(),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: Sizes.medium);
          },
        );
      },
    );
  }
}
