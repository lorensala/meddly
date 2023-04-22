import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';

class MedicineNamePage extends StatelessWidget {
  const MedicineNamePage({super.key});

  static const String routeName = '/medicine/name';

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

class MedicineNameView extends StatelessWidget {
  const MedicineNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const MedicineNameForm(),
    );
  }
}
