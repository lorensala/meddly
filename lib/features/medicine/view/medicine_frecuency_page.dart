import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/view/view.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineFrecuencyPage extends StatelessWidget {
  const MedicineFrecuencyPage({super.key});

  static const String routeName = '/medicine/frecuency';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const MedicineFrecuencyPage(),
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

class MedicineFrecuencyView extends StatelessWidget {
  const MedicineFrecuencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineFrecuencyForm(),
    );
  }
}
