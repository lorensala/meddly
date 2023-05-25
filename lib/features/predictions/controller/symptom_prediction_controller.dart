import 'package:meddly/features/predictions/predictions.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'symptom_prediction_controller.g.dart';

@riverpod
class SymptomPredictionController extends _$SymptomPredictionController {
  @override
  List<Symptom> build() {
    return [];
  }

  void add(Symptom result) {
    // cant add more than 6
    //! TODO(me): preguntar...
    // if (state.length >= 6) {
    //   return;
    // }

    // cant add the same symptom twice
    if (state.contains(result)) {
      return;
    }
    state = [...state, result];
  }

  void remove(Symptom result) {
    state = state.where((e) => e != result).toList();
  }

  void predict() {
    if (state.isNotEmpty) {
      ref
          .read(predictionControllerProvider.notifier)
          .predictWithSymptoms(state);
    }
  }
}
