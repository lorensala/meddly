import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicineDosisForm extends StatelessWidget {
  const MedicineDosisForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return Padding(
      padding: Sizes.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.secondary,
              borderRadius: BorderRadius.circular(Sizes.borderRadius),
            ),
            child: const Padding(
              padding: Sizes.padding,
              child: _DosisInputField(),
            ),
          ),
          const SizedBox(height: Sizes.mediumSpacing),
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.secondary,
              borderRadius: BorderRadius.circular(Sizes.borderRadius),
            ),
            child: BlocBuilder<MedicineFormCubit, MedicineFormState>(
              buildWhen: (previous, current) =>
                  previous.dosisUnit != current.dosisUnit,
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: MedicineDosisUnit.values
                      .map(
                        (unit) => ListTile(
                          title: Text(unit.value),
                          trailing: cubit.state.dosisUnit == unit
                              ? const Icon(Icons.check)
                              : null,
                          onTap: () => cubit.dosisUnitChanged(unit),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
          const SizedBox(height: Sizes.largeSpacing),
          Button(onPressed: () {}, label: 'Next'),
        ],
      ),
    );
  }
}

class _DosisInputField extends StatelessWidget {
  const _DosisInputField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return TextFormField(
      onChanged: cubit.dosisChanged,
      decoration: const InputDecoration(
        hintText: 'Dosis',
      ),
    );
  }
}
