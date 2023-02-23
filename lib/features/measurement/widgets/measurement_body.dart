import 'package:flutter/material.dart';
import 'package:meddly/features/measurement/bloc/bloc.dart';

/// {@template measurement_body}
/// Body of the MeasurementPage.
///
/// Add what it does
/// {@endtemplate}
class MeasurementBody extends StatelessWidget {
  /// {@macro measurement_body}
  const MeasurementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurementBloc, MeasurementState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
