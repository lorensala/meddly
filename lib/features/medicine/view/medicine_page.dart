import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicinePage extends HookWidget {
  const MedicinePage({super.key});

  static const String routeName = 'medicine';

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const MedicinePage());
  }

  @override
  Widget build(BuildContext context) {
    // final controller = useTabController(initialLength: 2);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(context.l10n.medicines),
        actions: const [
          MedicineFilter(),
        ],
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(kToolbarHeight),
        //   child: MedicineTabBar(controller: controller),
        // ),
      ),
      body: const _Active(),
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
