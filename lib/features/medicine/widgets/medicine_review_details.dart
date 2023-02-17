import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/cubit/cubit.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineReviewDetails extends StatelessWidget {
  const MedicineReviewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Sizes.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _MedicineInfo(),
            const SizedBox(height: Sizes.mediumSpacing),
            DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(Sizes.borderRadius),
              ),
              child: Padding(
                padding: Sizes.padding,
                child: Column(
                  children: const [
                    _StockField(),
                    SizedBox(height: Sizes.mediumSpacing),
                    _StockWarningField(),
                    SizedBox(height: Sizes.mediumSpacing),
                    _InstructionsField(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: Sizes.mediumSpacing),
            const _SaveButton(),
            const SizedBox(height: Sizes.largeSpacing),
          ],
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      builder: (context, state) {
        return Button(
          isValid: state.stock.valid &&
              state.stockWarning.valid &&
              state.instructions.valid,
          isLoading: state.status.isSubmissionInProgress,
          onPressed: () => context.read<MedicineFormCubit>().submit(),
          label: context.l10n.save,
        );
      },
    );
  }
}

class _MedicineInfo extends StatelessWidget {
  const _MedicineInfo();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      builder: (context, state) {
        return Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: context.colorScheme.primary,
              child: Text(
                state.name.value.substring(0, 2).toUpperCase(),
                style: context.textTheme.displaySmall!.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(width: Sizes.mediumSpacing),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.name.value,
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(height: Sizes.smallSpacing),
                  Text(
                    '${state.presentation.name.capitalize()}, ${state.dosis.value}${state.dosisUnit.value}',
                    style: context.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: Sizes.smallSpacing),
                  if (state.frecuency == MedicineFrecuency.regular)
                    Text(context.l10n.everyXdays(state.frecuencyValue)),
                  if (state.frecuency == MedicineFrecuency.specificDays)
                    Text(
                      context.l10n
                          .everyX(state.days.map((e) => e.name).join(', ')),
                    ),
                  if (state.frecuency == MedicineFrecuency.asNeeded)
                    Text(context.l10n.asNeeded),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class _StockWarningField extends StatelessWidget {
  const _StockWarningField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputLabel(
              label: context.l10n.stockWarning,
              isRequired: false,
            ),
            const SizedBox(height: Sizes.smallSpacing),
            TextFormField(
              textInputAction: TextInputAction.done,
              onChanged: context.read<MedicineFormCubit>().stockWarningChanged,
              keyboardType: TextInputType.number,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(
                errorText: state.stockWarning.invalid
                    ? context.l10n.invalidStockWarning
                    : null,
              ),
            ),
            const SizedBox(height: Sizes.smallSpacing),
            InputDescription(
              description: context.l10n.stockWarningDescription,
            )
          ],
        );
      },
    );
  }
}

class _StockField extends StatelessWidget {
  const _StockField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputLabel(label: context.l10n.currentStock, isRequired: false),
            const SizedBox(height: Sizes.smallSpacing),
            TextFormField(
              textInputAction: TextInputAction.done,
              onChanged: context.read<MedicineFormCubit>().stockChanged,
              keyboardType: TextInputType.number,
              style: context.textTheme.bodyMedium,
              decoration: InputDecoration(
                errorText: state.stock.invalid
                    ? context.l10n.invalidCurrentStock
                    : null,
              ),
            ),
            const SizedBox(height: Sizes.smallSpacing),
            InputDescription(
              description: context.l10n.currentStockDescription,
            ),
          ],
        );
      },
    );
  }
}

class _InstructionsField extends StatelessWidget {
  const _InstructionsField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFormCubit, MedicineFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputLabel(label: context.l10n.instructions, isRequired: false),
            const SizedBox(height: Sizes.smallSpacing),
            TextFormField(
              textInputAction: TextInputAction.done,
              onChanged: context.read<MedicineFormCubit>().instructionsChanged,
              keyboardType: TextInputType.multiline,
              style: context.textTheme.bodyMedium,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: context.l10n.instructionsHint,
                errorText: state.instructions.invalid
                    ? state.instructions.error?.when(
                        invalid: () => context.l10n.invalidInstructions,
                        tooLong: () => context.l10n.instructionsTooLong,
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
