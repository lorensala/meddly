import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';

class PredictionsSymptomsSearchBody extends StatelessWidget {
  const PredictionsSymptomsSearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const PredictionsSymptomsWrapSelected(),
        Padding(
          padding: const EdgeInsets.all(Sizes.medium),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.l10n.results,
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
        const Expanded(child: PredictionSymptomsResultList()),
      ],
    );
  }
}
