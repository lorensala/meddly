import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/predictions/predictions.dart';

class PredictionResultsPage extends StatelessWidget {
  const PredictionResultsPage({super.key});

  static const String routeName = '/predictions/results';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final predictionResults = ref.watch(predictionControllerProvider);

          return predictionResults.when(
            data: (results) {
              return Center(
                child: Text(results.toString()),
              );
            },
            error: (_, __) {
              return const Center(
                child: Text('Error'),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
