import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/predictions/predictions.dart';

class PredictionValidatePage extends HookConsumerWidget {
  const PredictionValidatePage({super.key});

  static const String routeName = 'validate';
  static const String fullRouteName =
      '${BrowsePage.routeName}/${PredictionsPage.routeName}/${PredictionValidatePage.routeName}';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox.shrink();
    // final prediction = ref.watch(predictionProvider);
    // final selectedDisease = useState<Disease?>(null);

    // return Scaffold(
    //   appBar: AppBar(),
    //   body: ListView.builder(
    //     itemCount: prediction.prediction.length,
    //     itemBuilder: (context, index) {
    //       final disease = prediction.prediction[index];
    //       return ListTile(
    //         title: Text(disease.disease),
    //         leading: Radio<String>(
    //           value: disease.disease,
    //           groupValue: selectedDisease.value?.disease,
    //           onChanged: (value) => selectedDisease.value?.disease == value,
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
