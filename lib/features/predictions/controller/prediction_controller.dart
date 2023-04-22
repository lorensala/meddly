import 'package:meddly/features/predictions/core/extensions.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prediction_controller.g.dart';

@riverpod
class PredictionController extends _$PredictionController {
  @override
  FutureOr<List<Disease>> build() {
    return [];
  }

  Future<void> predictWithSymptoms(List<Symptom> symptoms) async {
    final res = await ref
        .read(predictionsRepositoryProvider)
        .predictWithSymptoms(symptoms);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    state = res.fold(
      (l) => AsyncError(l.message(l10n), StackTrace.current),
      (r) {
        ref.read(goRouterProvider).push(PredictionResultsPage.routeName);
        return AsyncData(r);
      },
    );
  }
}
