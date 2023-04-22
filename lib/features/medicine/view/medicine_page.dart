import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meddly/features/medicine/medicine.dart';

class MedicinePage extends StatelessWidget {
  const MedicinePage({super.key});

  static const String routeName = '/medicine';

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
          GoRouter.of(context).push(MedicineNamePage.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MedicineView extends StatelessWidget {
  const MedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MedicineBody();
  }
}
