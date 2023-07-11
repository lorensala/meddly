import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicineHourForm extends StatelessWidget {
  const MedicineHourForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          children: [
            const MedicineVector(vector: Vectors.birthdate),
            const SizedBox(height: Sizes.large),
            InputLabel(
              label: context.l10n.selectDateMedicine,
              isRequired: true,
            ),
            const SizedBox(height: Sizes.medium),
            const _StartDateInput(),
            const SizedBox(height: Sizes.medium),
            InputLabel(
              label: context.l10n.selectTimeMedicine,
              isRequired: true,
            ),
            const SizedBox(height: Sizes.medium),
            const _HourSelector(),
            const SizedBox(height: Sizes.large),
          ],
        ),
      ),
    );
  }
}

class _HourSelector extends ConsumerWidget {
  const _HourSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFrecuency = ref.watch(
      medicineFormControllerProvider.select(
        (s) => s.frecuency,
      ),
    );
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final selectedHours = ref.watch(
      medicineFormControllerProvider.select(
        (s) => s.hours,
      ),
    );

    if (selectedFrecuency == MedicineFrecuency.asNeeded) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(Sizes.small),
      decoration: BoxDecoration(
        boxShadow: boxShadow(context),
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: Sizes.small,
        children: [
          GestureDetector(
            onTap: () async {
              final hour = await showAdaptiveTimePicker(
                context: context,
                initialTimeOfDay: const TimeOfDay(hour: 0, minute: 0),
              );

              if (hour != null) {
                notifier.hoursChanged(
                  {...selectedHours, hour}.toList(),
                );
              }
            },
            child: Chip(
              backgroundColor: context.colorScheme.primary.withOpacity(0.25),
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: context.colorScheme.primary),
                  Text(context.l10n.addHour),
                ],
              ),
            ),
          ),
          for (final hour in selectedHours)
            Chip(
              backgroundColor: context.colorScheme.primary.withOpacity(0.25),
              label: Text(hour.format(context)),
              deleteIconColor: context.colorScheme.primary,
              onDeleted: () {
                notifier.hoursChanged(
                  {...selectedHours}.toList()..remove(hour),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _StartDateInput extends HookConsumerWidget {
  const _StartDateInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final date = ref.watch(
      medicineFormControllerProvider.select(
        (s) => s.startDate,
      ),
    );
    final now = DateTime.now();

    final controller =
        useTextEditingController(text: date?.localizedString(context));

    ref.listen(medicineFormControllerProvider, (_, state) {
      controller.text = state.startDate?.localizedString(context) ?? '';
    });

    return TextFormField(
      readOnly: true,
      controller: controller,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: context.l10n.selectADate,
      ),
      onTap: () async {
        final date = await showAdaptiveDatePicker(
          context: context,
          initialDateTime: DateTime(
            now.year,
            now.month,
            now.day,
          ),
          firstDate: DateTime(
            now.year,
            now.month,
            now.day,
          ),
          lastDate: DateTime(
            now.year + 1,
            now.month,
            now.day,
          ),
        );
        if (date != null) {
          notifier.startDateChanged(date);
        }
      },
      keyboardType: TextInputType.number,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }
}
