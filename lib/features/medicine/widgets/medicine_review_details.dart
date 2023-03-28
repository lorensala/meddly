import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/controller/medicine_form_controller.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

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
            Column(
              children: const [
                _StockField(),
                SizedBox(height: Sizes.mediumSpacing),
                _StockWarningField(),
                SizedBox(height: Sizes.mediumSpacing),
                _InstructionsField(),
              ],
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

class _SaveButton extends ConsumerWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValid = ref.watch(isMedicineReviewValidProvider);
    final isLoading = ref.watch(medicineControllerProvider).isLoading;
    final notifier = ref.watch(medicineFormControllerProvider.notifier);

    return Button(
      isValid: isValid,
      isLoading: isLoading,
      onPressed: notifier.save,
      label: context.l10n.save,
    );
  }
}

class _MedicineInfo extends ConsumerWidget {
  const _MedicineInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicineName = ref.watch(medicineNameProvider);
    final medicinePresentation = ref.watch(medicinePresentationProvider);
    final medicineFrecuency = ref.watch(medicineFrecuencyProvider);
    final medicineFrecuencyValue = ref.watch(medicineFrecuencyValueProvider);
    final medicineDays = ref.watch(medicineDaysProvider);
    final medicineDosis = ref.watch(medicineDosisProvider);
    final medicineDosisUnit = ref.watch(medicineDosisUnitProvider);

    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: context.colorScheme.primary,
          child: Text(
            medicineName.value.substring(0, 2).toUpperCase(),
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
                medicineName.value,
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: Sizes.smallSpacing),
              Text(
                '${medicinePresentation.name.capitalize()}, ${medicineDosis.value}${medicineDosisUnit.value}',
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: Sizes.smallSpacing),
              if (medicineFrecuency == MedicineFrecuency.regular)
                Text(context.l10n.everyXdays(medicineFrecuencyValue)),
              if (medicineFrecuency == MedicineFrecuency.specificDays)
                Text(
                  context.l10n
                      .everyX(medicineDays.map((e) => e.name).join(', ')),
                ),
              if (medicineFrecuency == MedicineFrecuency.asNeeded)
                Text(context.l10n.asNeeded),
            ],
          ),
        )
      ],
    );
  }
}

class _StockWarningField extends ConsumerWidget {
  const _StockWarningField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final errorText = ref.watch(medicineStockWarningErrorTextProvider);

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
          onChanged: notifier.stockWarningChanged,
          keyboardType: TextInputType.number,
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
        const SizedBox(height: Sizes.smallSpacing),
        InputDescription(
          description: context.l10n.stockWarningDescription,
        )
      ],
    );
  }
}

class _StockField extends ConsumerWidget {
  const _StockField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final errorText = ref.watch(medicineStockErrorTextProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: context.l10n.currentStock, isRequired: false),
        const SizedBox(height: Sizes.smallSpacing),
        TextFormField(
          textInputAction: TextInputAction.done,
          onChanged: notifier.stockChanged,
          keyboardType: TextInputType.number,
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
        const SizedBox(height: Sizes.smallSpacing),
        InputDescription(
          description: context.l10n.currentStockDescription,
        ),
      ],
    );
  }
}

class _InstructionsField extends ConsumerWidget {
  const _InstructionsField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final errorText = ref.watch(medicineInstructionErrorTextProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: context.l10n.instructions, isRequired: false),
        const SizedBox(height: Sizes.smallSpacing),
        TextFormField(
          textInputAction: TextInputAction.done,
          onChanged: notifier.instructionsChanged,
          keyboardType: TextInputType.multiline,
          style: context.textTheme.bodyMedium,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: context.l10n.instructionsHint,
            errorText: errorText,
          ),
        ),
      ],
    );
  }
}
