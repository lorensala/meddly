import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/predictions/bloc/bloc.dart';
import 'package:meddly/features/predictions/widgets/widgets.dart';

/// {@template predictions_body}
/// Body of the PredictionsPage.
///
/// Add what it does
/// {@endtemplate}
class PredictionsBody extends StatelessWidget {
  /// {@macro predictions_body}
  const PredictionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PredictionsBloc, PredictionsState>(
      builder: (context, state) {
        return const SafeArea(
          child: Padding(
            padding: Sizes.padding,
            child: Center(child: SymptomSearchForm()),
          ),
        );
      },
    );
  }
}
