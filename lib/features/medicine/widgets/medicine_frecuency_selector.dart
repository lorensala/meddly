import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:medicine/medicine.dart';

class MedicineFrecuencySelector extends ConsumerWidget {
  const MedicineFrecuencySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final selectedFrecuency = ref.watch(
      medicineFormControllerProvider.select(
        (value) => value.frecuency,
      ),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: boxShadow(context),
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: MedicineFrecuency.values
            .map(
              (frecuency) => ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Sizes.small),
                ),
                selected: selectedFrecuency == frecuency,
                title: Text(
                  getl10nFrecuency(frecuency, context),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: selectedFrecuency == frecuency
                        ? context.colorScheme.primary
                        : context.colorScheme.onSecondary,
                  ),
                ),
                trailing: selectedFrecuency == frecuency
                    ? const Icon(Icons.check)
                    : null,
                onTap: () => notifier.frecuencyChanged(frecuency),
              ),
            )
            .toList(),
      ),
    );
  }
}
