import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineBody extends ConsumerWidget {
  const MedicineBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicines = ref.watch(medicineControllerProvider);
    final filteredMedicines = ref.watch(filteredMedicinesProvider);

    return AsyncValueWidget(
      value: medicines,
      onRetry: () => ref.read(medicineControllerProvider.notifier).refresh(),
      builder: (medicines) {
        if (medicines.isEmpty) {
          return EmptyContainer(
            message: context.l10n.emptyMedicines,
          );
        }

        if (filteredMedicines.isEmpty) {
          return EmptyContainer(
            message: context.l10n.emptyFilteredMedicines,
          );
        }

        return ListView.builder(
          itemCount: filteredMedicines.length,
          itemBuilder: (context, index) {
            final medicine = filteredMedicines[index];
            return ProviderScope(
              overrides: [
                medicineProvider.overrideWithValue(medicine),
              ],
              child: const MedicineListTile(),
            );
          },
        );
      },
    );
  }
}
