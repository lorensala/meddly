import 'package:meddly/features/predictions/controller/symptom_prediction_controller.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'symptom_selected_results_provider.g.dart';

@riverpod
List<Symptom> symptomSelectedResults(
  SymptomSelectedResultsRef ref,
) {
  return ref.watch(symptomPredictionControllerProvider);
}
