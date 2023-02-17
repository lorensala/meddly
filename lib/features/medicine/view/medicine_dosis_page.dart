import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';
import 'package:meddly/features/user/user.dart';

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
            // cancel button that navigates to home page
            // TODO: add a confirmation dialog
            // TODO: add in all the other pages
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushAndRemoveUntil(UserPage.route(), (_) => false),
              child: Padding(
                padding: Sizes.padding,
                child: Center(
                  child: Text(
                    'Cancel',
                    style: context.textTheme.bodyLarge,
                  ),
                ),
              ),
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
