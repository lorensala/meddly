import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/medicine/provider/medicines_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineBody extends ConsumerWidget {
  const MedicineBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicines = ref.watch(medicinesProvider);

    return AsyncValueWidget(
      value: medicines,
      builder: (medicines) {
        if (medicines.isEmpty) {
          return const EmptyContainer(
            message: 'No tienes medicinas registradas',
          );
        }

        return Padding(
          padding: Sizes.mediumPadding,
          child: ListView.separated(
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              final medicine = medicines[index];
              return ProviderScope(
                overrides: [
                  medicineProvider.overrideWithValue(medicine),
                ],
                child: const MedicineListTile(),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: Sizes.medium),
          ),
        );
      },
    );
  }
}
