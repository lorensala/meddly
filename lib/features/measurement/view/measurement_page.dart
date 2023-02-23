import 'package:flutter/material.dart';
import 'package:meddly/features/measurement/bloc/bloc.dart';
import 'package:meddly/features/measurement/widgets/measurement_body.dart';

/// {@template measurement_page}
/// A description for MeasurementPage
/// {@endtemplate}
class MeasurementPage extends StatelessWidget {
  /// {@macro measurement_page}
  const MeasurementPage({super.key});

  /// The static route for MeasurementPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MeasurementPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeasurementBloc(),
      child: const Scaffold(
        body: MeasurementView(),
      ),
    );
  }    
}

/// {@template measurement_view}
/// Displays the Body of MeasurementView
/// {@endtemplate}
class MeasurementView extends StatelessWidget {
  /// {@macro measurement_view}
  const MeasurementView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MeasurementBody();
  }
}
