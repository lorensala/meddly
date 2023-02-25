import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/widgets/widgets.dart';

/// {@template medicine_page}
/// A description for MedicineDosisPage
/// {@endtemplate}
class MedicineDosisPage extends StatelessWidget {
  /// {@macro medicine_page}
  const MedicineDosisPage({super.key});

  /// The static route for MedicinePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MedicineDosisPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CancelButton(
            onConfirm: () => Navigator.of(context)
                .pushAndRemoveUntil(MedicinePage.route(), (route) => false),
          ),
        ],
      ),
      body: const MedicineDosisView(),
    );
  }
}

/// {@template medicine_view}
/// Displays the Body of MedicineDosisView
/// {@endtemplate}
class MedicineDosisView extends StatelessWidget {
  /// {@macro medicine_view}
  const MedicineDosisView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineDosisForm(),
    );
  }
}
