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
            size: MediaQuery.of(context).size.height * 0.3,
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
            return ListTile(
              title: Text(prediction.id.toString()),
              subtitle: Text(prediction.prediction.toString()),
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
