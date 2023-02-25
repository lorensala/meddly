import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/view/view.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';
import 'package:meddly/widgets/widgets.dart';

/// {@template medicine_page}
/// A description for MedicineFrecuencyPage
/// {@endtemplate}
class MedicineFrecuencyPage extends StatelessWidget {
  /// {@macro medicine_page}
  const MedicineFrecuencyPage({super.key});

  /// The static route for MedicinePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MedicineFrecuencyPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine'),
        actions: [
          CancelButton(
            onConfirm: () => Navigator.of(context)
                .pushAndRemoveUntil(MedicinePage.route(), (route) => false),
          ),
        ],
      ),
      body: const MedicineFrecuencyView(),
    );
  }
}

/// {@template medicine_view}
/// Displays the Body of MedicineFrecuencyView
/// {@endtemplate}
class MedicineFrecuencyView extends StatelessWidget {
  /// {@macro medicine_view}
  const MedicineFrecuencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineFrecuencyForm(),
    );
  }
}
