import 'package:flutter/material.dart';
import 'package:meddly/features/medicine/bloc/bloc.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';

/// {@template medicine_body}
/// Body of the MedicinePage.
///
/// Add what it does
/// {@endtemplate}
class MedicineBody extends StatelessWidget {
  /// {@macro medicine_body}
  const MedicineBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        return Center(
          child: BlocProvider(
            create: (context) => MedicineFormCubit(),
            child: PageView(
              children: const [
                MedicineNameForm(),
                MedicinePresentationForm(),
                MedicineDosisForm(),
                MedicineFrecuencyForm(),
              ],
            ),
          ),
        );
      },
    );
  }
}
