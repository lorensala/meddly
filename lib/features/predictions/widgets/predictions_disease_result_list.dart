import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionDiseaseResultsList extends ConsumerWidget {
  const PredictionDiseaseResultsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(diseaseSearchResultsProvider);
    return AsyncValueWidget(
      value: results,
      builder: (results) {
        if (results.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Text(
              context.l10n.predictionsSearchNoResults,
              style: context.textTheme.titleSmall!.copyWith(
                color: context.colorScheme.onSecondary.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: results.length,
          padding: const EdgeInsets.symmetric(vertical: Sizes.medium),
          itemBuilder: (context, index) {
            final result = results[index];

            return ProviderScope(
              overrides: [
                diseaseSearchResultProvider.overrideWithValue(result),
              ],
              child: const PredictionDiseaseResultListItem(),
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
