import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'disease_search_results_provider.g.dart';

@riverpod
Future<List<Disease>> diseaseSearchResults(
  DiseaseSearchResultsRef ref,
) async {
  final query =
      ref.watch(diseaseSearchControllerProvider.select((value) => value.query));

  await ref.debounce(const Duration(milliseconds: 250));

  return ref.read(predictionsRepositoryProvider).searchDisease(query.value);
}
