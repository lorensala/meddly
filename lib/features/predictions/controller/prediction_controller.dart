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
    state = const AsyncLoading();
    final (err, diseases) = await ref
        .read(predictionsRepositoryProvider)
        .predictWithSymptoms(symptoms);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      state = AsyncData(diseases);
      await ref.read(goRouterProvider).push(
            PredictionResultsPage.fullRouteName,
          );
      ref.invalidate(consultsProvider);
    }
  }

  Future<void> predictWithImage(XFile file) async {
    state = const AsyncLoading();
    final (err, diseases) = await ref
        .read(predictionsRepositoryProvider)
        .predictWithImage(File(file.path));

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      state = AsyncData(diseases);
      await ref.read(goRouterProvider).push(
            PredictionResultsPage.fullRouteName,
          );
      ref.invalidate(consultsProvider);
    }
  }

  Future<void> validate({
    required Consult consult,
    required Disease disease,
    required bool approvalToSave,
  }) async {
    return switch (consult) {
      ConsultBySymptoms() => _validateBySymptoms(
          consult: consult,
          disease: disease,
          approvalToSave: approvalToSave,
        ),
      ConsultByImage() => _validateByImage(
          consult: consult,
          disease: disease,
          approvalToSave: approvalToSave,
        ),
    };
  }

  Future<void> _validateByImage({
    required Consult consult,
    required Disease disease,
    required bool approvalToSave,
  }) async {
    state = const AsyncLoading();
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (err, _) =
        await ref.read(predictionsRepositoryProvider).verifyConsultByImage(
              consult: consult,
              disease: disease,
              approvalToSave: approvalToSave,
            );

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref
        ..invalidate(consultsProvider)
        ..invalidateSelf();
      ref.read(goRouterProvider).pop();
    }
  }

  Future<void> _validateBySymptoms({
    required Consult consult,
    required Disease disease,
    required bool approvalToSave,
  }) async {
    state = const AsyncLoading();
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (err, _) =
        await ref.read(predictionsRepositoryProvider).verifyConsultBySymptoms(
              consult: consult,
              disease: disease,
              approvalToSave: approvalToSave,
            );

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref
        ..invalidate(consultsProvider)
        ..invalidateSelf();
      ref.read(goRouterProvider).pop();
    }
  }
}
