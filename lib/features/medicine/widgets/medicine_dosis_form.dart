import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/features/medicine/view/medicine_frecuency_page.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineDosisForm extends StatelessWidget {
  const MedicineDosisForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: Sizes.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(Sizes.borderRadius),
              ),
              child: Padding(
                padding: Sizes.padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputLabel(label: context.l10n.dosis, isRequired: true),
                    const SizedBox(height: Sizes.smallSpacing),
                    const _DosisInputField(),
                    const SizedBox(height: Sizes.smallSpacing),
                    InputDescription(
                      description: context.l10n.dosisDescription,
                    ),
                  ],
                ),
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
            const SizedBox(height: Sizes.mediumSpacing),
            const _NextButton(),
          ],
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      buildWhen: (previous, current) =>
          previous.dosis != current.dosis ||
          previous.dosisUnit != current.dosisUnit,
      builder: (context, state) {
        return Button(
          isValid: state.dosis.valid && state.dosis.value.isNotEmpty,
          onPressed: () => Navigator.of(context).push(
            MedicineFrecuencyPage.route(context.read<MedicineFormCubit>()),
          ),
          label: context.l10n.next,
        );
      },
    );
  }
}

class _DosisInputField extends StatelessWidget {
  const _DosisInputField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MedicineFormCubit>();
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      buildWhen: (previous, current) => previous.dosis != current.dosis,
      builder: (context, state) {
        return TextFormField(
          onChanged: cubit.dosisChanged,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: state.dosis.invalid ? context.l10n.invalidDosis : null,
          ),
        );
      },
    );
  }
}
