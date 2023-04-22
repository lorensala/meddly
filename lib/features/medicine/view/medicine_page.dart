import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/medicine.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Medicine'),
        ),
        body: const MedicineView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MedicineNamePage.route());
          },
          child: const Icon(Icons.add),
        ),);
  }
}

/// {@template medicine_view}
/// Displays the Body of MedicineNameView
/// {@endtemplate}
class MedicineView extends StatelessWidget {
  /// {@macro medicine_view}
  const MedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MedicineBody();
  }
}
