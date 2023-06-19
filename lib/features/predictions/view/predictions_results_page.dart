import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class PredictionResultsPage extends StatelessWidget {
  const PredictionResultsPage({super.key});

  static const String routeName = 'results';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.results),
      ),
      body: const PredictionResultsBody(),
    );
  }
}

class PredictionResultsBody extends StatelessWidget {
  const PredictionResultsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PredictionResultsList(),
        const SizedBox(height: Sizes.large),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
          child: Text(context.l10n.predictionsResultDescripcion),
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
                              child: _AnimatedLinearProgressIndicator(
                                value: result.probability,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            child: SizedBox(
                              width: 60,
                              child: Text(
                                '${result.probability * 100}%',
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

class _AnimatedLinearProgressIndicator extends HookWidget {
  const _AnimatedLinearProgressIndicator({
    required this.value,
  });
  final double value;
  static const Duration _duration = Duration(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(duration: _duration);
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
