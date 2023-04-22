import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionSymptomsResultList extends ConsumerWidget {
  const PredictionSymptomsResultList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(symptomSearchResultsProvider);

    if (results.isEmpty) {
      return const EmptyContainer(
        message: 'No results found for your search',
      );
    }

    return ListView.separated(
      itemCount: results.length,
      shrinkWrap: true,
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
  }
}
