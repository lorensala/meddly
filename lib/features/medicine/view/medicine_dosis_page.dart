import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineDosisPage extends StatelessWidget {
  const MedicineDosisPage({super.key});

  static const String routeName = '/medicine/dosis';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicineDosisPage(),
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

class MedicineDosisView extends StatelessWidget {
  const MedicineDosisView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const MedicineDosisForm(),
      ),
    );
  }
}
