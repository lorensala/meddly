import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';

class PredictionSymptomsPage extends ConsumerWidget {
  const PredictionSymptomsPage({super.key});

  static const String routeName = 'symptoms';
  static const String fullRouteName =
      '${BrowsePage.routeName}/${PredictionsPage.routeName}/${PredictionSymptomsPage.routeName}';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(predictionControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) => showSnackBar(context, err.toString()),
      );
    });

    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(Sizes.medium),
        child: SizedBox(
          height: Sizes.buttonHeight,
          child: PredictionsButton(),
        ),
      ),
      appBar: AppBar(
        title: Text(context.l10n.orientativeConsultations),
      ),
      body: const PredictionsSymptomsBody(),
    );
  }
}
