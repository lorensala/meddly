import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicineReviewDetails extends StatelessWidget {
  const MedicineReviewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(Sizes.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MedicineInfo(),
            SizedBox(height: Sizes.medium),
            Column(
              children: [
                _StockField(),
                SizedBox(height: Sizes.medium),
                _StockWarningField(),
                SizedBox(height: Sizes.medium),
                _InstructionsField(),
              ],
            ),
            SizedBox(height: Sizes.large),
          ],
        ),
      ),
    );
  }
}

class _MedicineInfo extends ConsumerWidget {
  const _MedicineInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicineName =
        ref.watch(medicineFormControllerProvider.select((s) => s.name));
    final medicinePresentation =
        ref.watch(medicineFormControllerProvider.select((s) => s.presentation));
    final medicineFrecuency =
        ref.watch(medicineFormControllerProvider.select((s) => s.frecuency));
    final medicineFrecuencyValue = ref
        .watch(medicineFormControllerProvider.select((s) => s.frecuencyValue));
    final medicineDays =
        ref.watch(medicineFormControllerProvider.select((s) => s.days));
    final medicineDosis =
        ref.watch(medicineFormControllerProvider.select((s) => s.dosis));
    final medicineDosisUnit =
        ref.watch(medicineFormControllerProvider.select((s) => s.dosisUnit));

    String getMedicineInitials() {
      if (medicineName.value.length == 1) {
        return '${medicineName.value[0]}${medicineName.value[0]}'.toUpperCase();
      }
      return (medicineName.value[0] + medicineName.value[1]).toUpperCase();
    }

    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: context.colorScheme.primary,
          child: Text(
            getMedicineInitials(),
            style: context.textTheme.displaySmall!.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(width: Sizes.medium),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                medicineName.value,
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: Sizes.small),
              Text(
                '${medicinePresentation.name.capitalize()}, ${medicineDosis.value}${medicineDosisUnit.value}',
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(height: Sizes.small),
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
        const SizedBox(height: Sizes.small),
        TextFormField(
          style: context.textTheme.bodyMedium,
          textInputAction: TextInputAction.done,
          onChanged: notifier.stockWarningChanged,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
        const SizedBox(height: Sizes.small),
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
        const SizedBox(height: Sizes.small),
        TextFormField(
          textInputAction: TextInputAction.done,
          onChanged: notifier.stockChanged,
          keyboardType: TextInputType.number,
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            errorText: errorText,
          ),
        ),
        const SizedBox(height: Sizes.small),
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
        const SizedBox(height: Sizes.small),
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
