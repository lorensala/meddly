import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/controller/medicine_form_controller.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicineDosisForm extends StatelessWidget {
  const MedicineDosisForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Sizes.mediumPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _DosisInput(),
            const SizedBox(height: Sizes.medium),
            const _DosisUnitSelector(),
            const SizedBox(height: Sizes.medium),
            const _NextButton(),
          ],
        ),
      ),
    );
  }
}

class _DosisUnitSelector extends ConsumerWidget {
  const _DosisUnitSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDosisUnit = ref.watch(medicineDosisUnitProvider);
    final notifier = ref.watch(medicineFormControllerProvider.notifier);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: MedicineDosisUnit.values
            .map(
              (unit) => ListTile(
                title: Text(unit.value),
                trailing:
                    selectedDosisUnit == unit ? const Icon(Icons.check) : null,
                onTap: () => notifier.dosisUnitChanged(unit),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _DosisInput extends StatelessWidget {
  const _DosisInput();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: context.l10n.dosis, isRequired: true),
        const SizedBox(height: Sizes.small),
        const _DosisInputField(),
        const SizedBox(height: Sizes.small),
        InputDescription(
          description: context.l10n.dosisDescription,
        ),
      ],
    );
  }
}

class _NextButton extends ConsumerWidget {
  const _NextButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isMedicineDosisValidProvider);
    return Button(
      isValid: isValid,
      onPressed: () => Navigator.of(context).push(
        MedicineFrecuencyPage.route(),
      ),
      label: context.l10n.next,
    );
  }
}

class _DosisInputField extends ConsumerWidget {
  const _DosisInputField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(medicineFormControllerProvider.notifier);
    final errorText = ref.watch(medicineDosisErrorTextProvider);

    return TextFormField(
      onChanged: notifier.dosisChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        errorText: errorText,
      ),
    );
  }
}
