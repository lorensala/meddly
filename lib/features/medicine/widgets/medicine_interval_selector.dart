import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/setup/widgets/widgets.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedcineIntervalSelector extends ConsumerWidget {
  const MedcineIntervalSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFrecuency =
        ref.watch(medicineFormControllerProvider).frecuency;

    return selectedFrecuency == MedicineFrecuency.asNeeded
        ? const SizedBox.shrink()
        : Column(
            children: [
              FormTitle(
                title: context.l10n.chooseTheIntervalBetweenDoses,
                isRequired: true,
              ),
              const SizedBox(height: Sizes.large),
              const _IntervalBody(),
            ],
          );
  }
}

class _IntervalBody extends HookConsumerWidget {
  const _IntervalBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFrequency =
        ref.watch(medicineFormControllerProvider).frecuency;
    final selectedFrecuencValue = ref.watch(
      medicineFormControllerProvider.select((value) => value.frecuencyValue),
    );
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final selectedDays =
        ref.watch(medicineFormControllerProvider.select((value) => value.days));

    final List<DropdownMenuItem<int>> items = useMemoized(
      () => [
        for (var i = 1; i <= 100; i++)
          DropdownMenuItem(
            value: i,
            child: Text(i.toDaysString()),
          ),
      ],
    );

    switch (selectedFrequency) {
      case MedicineFrecuency.regular:
        return Container(
          padding: const EdgeInsets.all(Sizes.medium),
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            boxShadow: boxShadow(context),
            borderRadius: BorderRadius.circular(Sizes.small),
          ),
          child: Row(
            children: [
              Text(
                context.l10n.every,
                style: context.textTheme.titleMedium,
              ),
              const Spacer(),
              DropDownSelector<int>(
                items: items,
                onChanged: notifier.frecuencyValueChanged,
                value: selectedFrecuencValue,
              ),
            ],
          ),
        );
      case MedicineFrecuency.specificDays:
        return DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.secondary,
            boxShadow: boxShadow(context),
            borderRadius: BorderRadius.circular(Sizes.small),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: MedicineDay.values
                      .map(
                        (day) => GestureDetector(
                          onTap: () => notifier.daysChanged(day),
                          child: CircleAvatar(
                            backgroundColor: selectedDays.contains(day)
                                ? context.colorScheme.primary
                                : context.colorScheme.secondary,
                            child: Text(
                              day.name.substring(0, 1).toUpperCase(),
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: selectedDays.contains(day)
                                    ? context.colorScheme.onPrimary
                                    : context.colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: Sizes.medium),
                Text(
                  selectedDays.isEmpty
                      ? context.l10n.selectAtLeastOneDay
                      : '${context.l10n.everyX(selectedDays.map((e) => e.name).join(', '))}.',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: selectedDays.isEmpty
                        ? context.colorScheme.error
                        : context.colorScheme.onSecondary.withOpacity(0.7),
                  ),
                )
              ],
            ),
          ),
        );
      case MedicineFrecuency.asNeeded:
        return const SizedBox.shrink();
      // ignore: no_default_cases
      default:
        return const SizedBox.shrink();
    }
  }
}
