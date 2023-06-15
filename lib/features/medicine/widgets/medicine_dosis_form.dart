import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:medicine/medicine.dart';

class MedicineDosisForm extends StatelessWidget {
  const MedicineDosisForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
              child: SvgPicture.asset(Vectors.medicineDosis),
            ),
            const SizedBox(height: Sizes.large),
            const FormTitle(
              title: 'Ingrese la dosis del medicamento',
              isRequired: true,
            ),
            const SizedBox(height: Sizes.small),
            FormSubtitle(subtitle: context.l10n.dosisDescription),
            const SizedBox(height: Sizes.large),
            const _DosisInputField(),
            const SizedBox(height: Sizes.medium),
            const _DosisUnitSelector(),
            const SizedBox(height: Sizes.medium),
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
    final selectedDosisUnit = ref.watch(
      medicineFormControllerProvider.select(
        (controller) => controller.dosisUnit,
      ),
    );
    final notifier = ref.watch(medicineFormControllerProvider.notifier);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: boxShadow(context),
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: MedicineDosisUnit.values
            .map(
              (unit) => ListTile(
                selected: selectedDosisUnit == unit,
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

class _DosisInputField extends ConsumerWidget {
  const _DosisInputField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(medicineFormControllerProvider.notifier);
    final errorText = ref.watch(medicineDosisErrorTextProvider);
    final selectedDosisUnit = ref.watch(
      medicineFormControllerProvider.select(
        (controller) => controller.dosisUnit,
      ),
    );

    return TextFormField(
      style: context.textTheme.bodyMedium,
      onChanged: notifier.dosisChanged,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        errorText: errorText,
        suffixText: selectedDosisUnit.value,
      ),
    );
  }
}
