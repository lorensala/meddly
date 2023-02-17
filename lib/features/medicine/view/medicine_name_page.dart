import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
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
    return BlocProvider(
      create: (context) => MedicineFormCubit(
        medicineRepository: GetIt.I.get<MedicineRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Medicine'),
        ),
        body: const MedicineNameView(),
      ),
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
