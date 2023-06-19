import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineTabView extends StatelessWidget {
  const MedicineTabView({
    required this.controller,
    super.key,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const [
        _All(),
        _Active(),
        _Archived(),
      ],
    );
  }
}

class _All extends ConsumerWidget {
  const _All();

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
    final medicines = ref.watch(medicineControllerProvider);

    return AsyncValueWidget(
      value: medicines,
      builder: (medicines) {
        return EmptyContainer(
          message: context.l10n.emptyMedicines,
        );

        // if (medicines.isEmpty) {
        //   return EmptyContainer(
        //     message: context.l10n.emptyMedicines,
        //   );
        // }

        // if (filteredMedicines.isEmpty) {
        //   return EmptyContainer(
        //     message: context.l10n.emptyFilteredMedicines,
        //   );
        // }

        // return ListView.builder(
        //   itemCount: filteredMedicines.length,
        //   itemBuilder: (context, index) {
        //     final medicine = filteredMedicines[index];
        //     return ProviderScope(
        //       overrides: [
        //         medicineProvider.overrideWithValue(medicine),
        //       ],
        //       child: const MedicineListTile(),
        //     );
        //   },
        // );
      },
    );
  }
}
