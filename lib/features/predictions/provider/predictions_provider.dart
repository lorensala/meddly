import 'package:meddly/features/predictions/controller/symptom_search_controller.dart';
import 'package:meddly/provider/provider.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'predictions_provider.g.dart';

@riverpod
PredictionsApi predictionsApi(PredictionsApiRef ref) {
  return PredictionsApi(ref.read(dioProvider));
}

@riverpod
PredictionsRepository predictionsRepository(PredictionsRepositoryRef ref) {
  return PredictionsRepository(api: ref.read(predictionsApiProvider));
}

@riverpod
List<SymptomSearchResult> symptomSearchResults(
  SymptomSearchResultsRef ref,
) {
  return ref.watch(symptomSearchControllerProvider).results;
}
