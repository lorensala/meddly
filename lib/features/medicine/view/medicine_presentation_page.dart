import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/bloc/bloc.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';

/// {@template medicine_page}
/// A description for MedicinePresentationPage
/// {@endtemplate}
class MedicinePresentationPage extends StatelessWidget {
  /// {@macro medicine_page}
  const MedicinePresentationPage({super.key});

  /// The static route for MedicinePresentationPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicinePresentationPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicineBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Medicine'),
        ),
        body: const MedicinePresentationView(),
      ),
    );
  }
}

/// {@template medicine_view}
/// Displays the Body of MedicineView
/// {@endtemplate}
class MedicinePresentationView extends StatelessWidget {
  /// {@macro medicine_view}
  const MedicinePresentationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicinePresentationForm(),
    );
  }
}
