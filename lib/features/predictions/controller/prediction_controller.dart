import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:meddly/features/predictions/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:predictions/predictions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prediction_controller.g.dart';

@riverpod
class PredictionController extends _$PredictionController {
  @override
  FutureOr<List<Prediction>> build() async {
    return <Prediction>[];
  }

  Future<void> predictWithSymptoms(List<Symptom> symptoms) async {
    final (err, diseases) = await ref
        .read(predictionsRepositoryProvider)
        .predictWithSymptoms(symptoms);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      state = AsyncData(diseases);
      ref.read(goRouterProvider).pop();
      await ref.read(goRouterProvider).push(
            PredictionResultsPage.fullRouteName,
          );
    }
  }

  Future<void> predictWithImage(XFile file) async {
    final (err, diseases) = await ref
        .read(predictionsRepositoryProvider)
        .predictWithImage(File(file.path));

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      state = AsyncData(diseases);
      ref.read(goRouterProvider).pop();
      await ref.read(goRouterProvider).push(
            PredictionResultsPage.fullRouteName,
          );
    }
  }

  Future<void> verifyPredictionBySymptoms({
    required Consult consult,
    required Disease realDisease,
  }) async {
    final (err, _) =
        await ref.read(predictionsRepositoryProvider).verifyConsultBySymptoms(
              consult: consult,
              disease: realDisease,
              approvalToSave: true,
            );

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref.invalidateSelf();
    }
  }
}
