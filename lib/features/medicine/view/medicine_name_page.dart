import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';

/// {@template medicine_page}
/// A description for MedicinePage
/// {@endtemplate}
class MedicineNamePage extends StatelessWidget {
  /// {@macro medicine_page}
  const MedicineNamePage({super.key});

  /// The static route for MedicinePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MedicineNamePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine'),
      ),
      body: const MedicineNameView(),
    );
  }
}

/// {@template medicine_view}
/// Displays the Body of MedicineNameView
/// {@endtemplate}
class MedicineNameView extends StatelessWidget {
  /// {@macro medicine_view}
  const MedicineNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineNameForm(),
    );
  }
}
