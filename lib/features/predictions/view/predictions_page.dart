import 'package:flutter/material.dart';
import 'package:meddly/features/predictions/widgets/predictions_body.dart';

/// {@template predictions_page}
/// A description for PredictionsPage
/// {@endtemplate}
class PredictionsPage extends StatelessWidget {
  /// {@macro predictions_page}
  const PredictionsPage({super.key});

  /// The static route for PredictionsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PredictionsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predictions'),
      ),
      body: const PredictionsView(),
    );
  }
}

/// {@template predictions_view}
/// Displays the Body of PredictionsView
/// {@endtemplate}
class PredictionsView extends StatelessWidget {
  /// {@macro predictions_view}
  const PredictionsView({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocListener<SymptomSearchCubit, SymptomSearchState>(
    //   listener: (context, state) {
    //     if (state.status == FormzStatus.submissionFailure) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text('Submission failed. ${state.failure}'),
    //         ),
    //       );
    //     }
    //   },
    // child:
    return const PredictionsBody();
    // );
  }
}
