import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';
import 'package:meddly/features/user/view/view.dart';
import 'package:meddly/widgets/widgets.dart';

/// {@template medicine_page}
/// A description for MedicineFrecuencyPage
/// {@endtemplate}
class MedicineFrecuencyPage extends StatelessWidget {
  /// {@macro medicine_page}
  const MedicineFrecuencyPage(this.cubit, {super.key});

  final MedicineFormCubit cubit;

  /// The static route for MedicinePage
  static Route<dynamic> route(MedicineFormCubit cubit) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MedicineFrecuencyPage(cubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Medicine'),
          actions: [
            CancelButton(
              onConfirm: () => Navigator.of(context)
                  .pushAndRemoveUntil(UserPage.route(), (route) => false),
            ),
          ],
        ),
        body: const MedicineFrecuencyView(),
      ),
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
