import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineTabView extends ConsumerWidget {
  const MedicineTabView({
    required this.controller,
    super.key,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..watch(medicineControllerProvider)
      ..watch(archivedMedicineControllerProvider);

    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const [
        _Active(),
        _Archived(),
      ],
    );
  }
}

class _Active extends ConsumerWidget {
  const _Active();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicines = ref.watch(medicineControllerProvider);
    final filteredMedicines = ref.watch(filteredMedicinesProvider);

    return AsyncValueWidget(
      value: medicines,
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

class _Archived extends ConsumerWidget {
  const _Archived();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archivedMedicines = ref.watch(archivedMedicineControllerProvider);
    final filteredArchivedMedicines =
        ref.watch(filteredArchivedMedicinesProvider);

    return AsyncValueWidget(
      value: archivedMedicines,
      builder: (medicines) {
        if (medicines.isEmpty) {
          return EmptyContainer(
            message: context.l10n.emptyMedicines,
          );
        }

        if (filteredArchivedMedicines.isEmpty) {
          return EmptyContainer(
            message: context.l10n.emptyFilteredMedicines,
          );
        }

        return ListView.builder(
          itemCount: filteredArchivedMedicines.length,
          itemBuilder: (context, index) {
            final medicine = filteredArchivedMedicines[index];
            return ProviderScope(
              overrides: [
                medicineProvider.overrideWithValue(medicine),
              ],
              child: const MedicineListTile(isArchived: true),
            );
          },
        );
      },
    );
  }
}
