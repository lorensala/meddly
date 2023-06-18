import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionResultsPage extends StatelessWidget {
  const PredictionResultsPage({super.key});

  static const String routeName = 'results';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: const PredictionResultsBody(),
    );
  }
}

class PredictionResultsBody extends StatelessWidget {
  const PredictionResultsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PredictionResultsList(),
        SizedBox(height: Sizes.large),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.medium),
          child: Text(
            '''La interpretación de los resultados obtenidos mediante la evaluación realizada por Meddly se fundamenta en la estimación de la probabilidad de presencia de una enfermedad, por lo que es importante tener en cuenta que dichos resultados no deben ser considerados como un diagnóstico médico definitivo.''',
          ),
        )
      ],
    );
  }
}

class PredictionResultsList extends ConsumerWidget {
  const PredictionResultsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final predictionResults = ref.watch(predictionControllerProvider);

    return AsyncValueWidget(
      value: predictionResults,
      builder: (results) {
        if (results.isEmpty) {
          return const Center(child: Text('No results'));
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: results.length,
          itemBuilder: (context, index) {
            final result = results[index];

            if (result.probability == 0) return const SizedBox.shrink();

            return ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: Sizes.small),
                child: Text(
                  result.disease,
                  style: context.textTheme.titleSmall,
                ),
              ),
              subtitle: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: Sizes.large,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          SizedBox(
                            height: Sizes.large,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: AnimatedLinearProgressIndicator(
                                value: result.probability,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            child: SizedBox(
                              width: 60,
                              child: Text(
                                '${result.probability}%',
                                textAlign: TextAlign.end,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class AnimatedLinearProgressIndicator extends HookWidget {
  const AnimatedLinearProgressIndicator({
    required this.value,
    super.key,
    this.duration = const Duration(milliseconds: 800),
  });
  final double value;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(duration: duration);
    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    final animation = useAnimation<double>(
      Tween<double>(begin: 0, end: value).animate(curvedAnimation),
    );

    useEffect(
      () {
        animationController.forward();
        return animationController.dispose;
      },
      [],
    );

    return LinearProgressIndicator(
      value: animation,
      color: context.colorScheme.primary.withOpacity(0.8),
      backgroundColor: context.colorScheme.onBackground.withOpacity(0.05),
      minHeight: 8,
    );
  }
}
