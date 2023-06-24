import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionsBody extends ConsumerWidget {
  const PredictionsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final predictions = ref.watch(predictionControllerProvider);

    return AsyncValueWidget(
      value: predictions,
      builder: (_) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PredictionCard(
                  title: context.l10n.imageScan,
                  description: context.l10n.imageScanDescription,
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      useRootNavigator: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(Sizes.medium),
                        ),
                      ),
                      builder: (context) {
                        return const ImagePickerBottomSheet();
                      },
                    );
                  },
                  vector: Vectors.medicines,
                ),
                const SizedBox(height: Sizes.medium),
                PredictionCard(
                  title: context.l10n.enterSympthoms,
                  description: context.l10n.enterSympthomsDescription,
                  onTap: () => ref.read(goRouterProvider).push(
                        PredictionSymptomsPage.fullRouteName,
                      ),
                  vector: Vectors.measurements,
                ),
                const SizedBox(height: Sizes.large),
                Text(
                  'Ultimas consultas',
                  style: context.textTheme.titleMedium,
                ),
                const SizedBox(height: Sizes.large),
                const LastPredictions(),
              ],
            ),
          ),
        );
      },
    );
  }
}
