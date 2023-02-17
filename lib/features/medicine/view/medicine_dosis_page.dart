import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/widgets/widgets.dart';

/// {@template medicine_page}
/// A description for MedicineDosisPage
/// {@endtemplate}
class MedicineDosisPage extends StatelessWidget {
  /// {@macro medicine_page}
  const MedicineDosisPage(this.cubit, {super.key});

  final MedicineFormCubit cubit;

  /// The static route for MedicinePage
  static Route<dynamic> route(MedicineFormCubit cubit) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MedicineDosisPage(cubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            CancelButton(
              onConfirm: () => Navigator.of(context)
                  .pushAndRemoveUntil(UserPage.route(), (route) => false),
            ),
          ],
        ),
        body: const MedicineDosisView(),
      ),
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
