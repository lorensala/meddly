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
            SizedBox(height: Sizes.large),
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
    final medicine = ref.watch(medicineFormControllerProvider);

    String getMedicineInitials() {
      if (medicine.name.value.length == 1) {
        return '${medicine.name.value[0]}${medicine.name.value[0]}'
            .toUpperCase();
      }
      return (medicine.name.value[0] + medicine.name.value[1]).toUpperCase();
    }

    return Row(
      children: [
        CircleAvatar(
          radius: Sizes.extraLarge,
          backgroundColor: context.colorScheme.primary,
          child: Text(
            getMedicineInitials(),
            style: context.textTheme.bodyLarge!.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(width: Sizes.medium),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    // ignore: lines_longer_than_80_chars
                    '${medicine.name.value} ${medicine.dosis.value}${medicine.dosisUnit.value}',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: Sizes.extraSmall),
                  Text(
                    // ignore: lines_longer_than_80_chars
                    '- ${medicine.presentation.localizedString(context.l10n)}',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: Sizes.extraSmall),
              if (medicine.frecuency == MedicineFrecuency.regular)
                Text(context.l10n.everyXdays(medicine.frecuencyValue)),
              if (medicine.frecuency == MedicineFrecuency.specificDays)
                Text(
                  context.l10n.everyX(
                    medicine.days
                        .map((e) => e.localizedString(context.l10n))
                        .join(', '),
                  ),
                ),
              if (medicine.frecuency == MedicineFrecuency.asNeeded)
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
        TextFormField(
          style: context.textTheme.bodyMedium,
          textInputAction: TextInputAction.done,
          onChanged: notifier.stockWarningChanged,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorText: errorText,
            labelText: context.l10n.stockWarning,
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
        TextFormField(
          textInputAction: TextInputAction.done,
          onChanged: notifier.stockChanged,
          keyboardType: TextInputType.number,
          style: context.textTheme.bodyMedium,
          decoration: InputDecoration(
            errorText: errorText,
            labelText: context.l10n.currentStock,
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

    return TextFormField(
      textInputAction: TextInputAction.done,
      onChanged: notifier.instructionsChanged,
      keyboardType: TextInputType.multiline,
      style: context.textTheme.bodyMedium,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: context.l10n.instructionsHint,
        errorText: errorText,
        labelText: context.l10n.instructions,
        alignLabelWithHint: true,
      ),
    );
  }
}
