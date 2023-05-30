import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/predictions.dart';
import 'package:meddly/widgets/widgets.dart';

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

          return AsyncValueWidget(
            value: predictionResults,
            builder: (results) {
              if (results.isEmpty) {
                return const Center(child: Text('No results'));
              }

              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final result = results[index];
                  return ListTile(
                    title: Text(result.disease),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LinearProgressIndicator(
                              value: result.probability,
                              backgroundColor: context.colorScheme.surface,
                              minHeight: 8,
                            ),
                          ),
                        ),
                        const SizedBox(width: Sizes.medium),
                        Text(
                          '${result.probability}%',
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
