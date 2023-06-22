import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/widgets/widgets.dart';

class LastPredictions extends ConsumerWidget {
  const LastPredictions({
    super.key,
  });

  static const int lastPredictionsCount = 3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final predictions = ref.watch(predictionsBySymptomsProvider);

    return AsyncValueWidget(
      value: predictions,
      builder: (predictions) {
        if (predictions.isEmpty) {
          return EmptyContainer(
            isFlex: false,
            size: context.height * 0.3,
            message: 'Aún no tienes consultas orientativas',
          );
        }

        final lastPredictions = predictions.take(lastPredictionsCount).toList();

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lastPredictions.length,
          itemBuilder: (context, index) {
            final prediction = lastPredictions[index];

            return ElevatedButton(
              onPressed: () {},
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Sizes.small),
                  color: context.colorScheme.secondary,
                  boxShadow: boxShadow(context),
                ),
                child: ListTile(
                  title: Text(
                    'Predicción por síntomas',
                    style: context.textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    prediction.verified
                        ? 'Validada'
                        : 'Pendiente de validación',
                    style: context.textTheme.bodySmall?.copyWith(
                        // color: context.colorScheme.onBackground.withOpacity(0.5),
                        ),
                  ),
                  trailing: Text(
                    prediction.createdAt.localizedString(context),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onBackground.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: Sizes.medium,
          ),
        );
      },
    );
  }
}
