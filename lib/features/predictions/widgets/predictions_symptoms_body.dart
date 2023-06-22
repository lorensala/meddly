import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionsSymptomsBody extends HookWidget {
  const PredictionsSymptomsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSearching = useState(false);

    if (isSearching.value) {
      return const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(Sizes.medium),
            child: PredictionsSymptomsSearchField(),
          ),
          Expanded(child: PredictionsSymptomsSearchBody()),
        ],
      );
    } else {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.medium),
          child: SizedBox(
            height: context.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: Sizes.medium),
                Flexible(
                  child: Center(
                    child: SvgPicture.asset(Vectors.predictionsSymptoms),
                  ),
                ),
                const SizedBox(height: Sizes.medium),
                const InputLabel(
                  label: 'Ingrese sus síntomas',
                  isRequired: true,
                ),
                const SizedBox(height: Sizes.medium),
                PredictionsSymptomsSearchField(
                  enabled: false,
                  onTap: () => isSearching.value = true,
                ),
                const SizedBox(height: Sizes.medium),
                const PredictionsSymptomsWrapSelected(),
                const SizedBox(height: Sizes.large),
              ],
            ),
          ),
        ),
      );
    }
  }
}
