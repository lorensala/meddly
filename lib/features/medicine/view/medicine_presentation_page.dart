import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicinePresentationPage extends StatelessWidget {
  const MedicinePresentationPage({super.key});

  static const String routeName = '/medicine/presentation';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicinePresentationPage(),
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
      body: const MedicinePresentationView(),
    );
  }
}

class MedicinePresentationView extends StatelessWidget {
  const MedicinePresentationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const MedicinePresentationForm(),
      ),
    );
  }
}
