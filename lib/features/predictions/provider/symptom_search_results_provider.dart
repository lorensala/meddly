import 'package:meddly/features/predictions/predictions.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'symptom_search_results_provider.g.dart';

@riverpod
List<Symptom> symptomSearchResults(
  SymptomSearchResultsRef ref,
) {
  return ref.watch(symptomSearchControllerProvider).results;
}
