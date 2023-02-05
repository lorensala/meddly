import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/bloc/bloc.dart';
import 'package:meddly/features/medicine/widgets/medicine_body.dart';

/// {@template medicine_page}
/// A description for MedicinePage
/// {@endtemplate}
class MedicinePage extends StatelessWidget {
  /// {@macro medicine_page}
  const MedicinePage({super.key});

  /// The static route for MedicinePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MedicinePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicineBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Medicine'),
        ),
        body: const MedicineView(),
      ),
    );
  }
}

/// {@template medicine_view}
/// Displays the Body of MedicineView
/// {@endtemplate}
class MedicineView extends StatelessWidget {
  /// {@macro medicine_view}
  const MedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MedicineBody();
  }
}
