import 'package:meddly/features/predictions/core/extensions.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'predictions_by_symptoms_provider.g.dart';

@riverpod
class PredictionsBySymptoms extends _$PredictionsBySymptoms {
  @override
  Future<List<Prediction>> build() async {
    final (err, predictions) = await ref
        .read(predictionsRepositoryProvider)
        .fetchPredictionsBySymptoms();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      throw Exception(err.describe(l10n));
    } else {
      return predictions;
    }
  }
}
