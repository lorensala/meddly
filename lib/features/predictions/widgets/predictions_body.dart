import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/view/view.dart';
import 'package:meddly/features/predictions/widgets/widgets.dart';
import 'package:meddly/router/provider/go_router_provider.dart';

class PredictionsBody extends ConsumerWidget {
  const PredictionsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PredictionCard(
              title: 'Escaneo por imágen',
              description: 'Escanea una parte de tu cuerpo y te diremos que es',
              onTap: () {},
              vector: Vectors.medicines,
            ),
            const SizedBox(height: Sizes.medium),
            PredictionCard(
              title: 'Ingreso de síntomas',
              description: 'Escanea una parte de tu cuerpo y te diremos que es',
              onTap: () => ref
                  .read(goRouterProvider)
                  .push(PredictionSymptomsPage.routeName),
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
  }
}
