import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';

class PredictionsSymptomsBody extends StatelessWidget {
  const PredictionsSymptomsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: SizedBox(
          height: context.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: Sizes.medium),
              Flexible(
                child: SvgPicture.asset(Vectors.predictionsSymptoms),
              ),
              const SizedBox(height: Sizes.medium),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ingrese sus síntomas',
                  style: context.textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: Sizes.medium),
              const PredictionsSymptomsSearchField(
                enabled: false,
              ),
              const SizedBox(height: Sizes.medium),
              const PredictionsSymptomsWrapSelected(),
              const SizedBox(height: Sizes.large),
              const PredictionsButton(),
              const SizedBox(height: Sizes.large),
            ],
          ),
        ),
      ),
    );
  }
}
