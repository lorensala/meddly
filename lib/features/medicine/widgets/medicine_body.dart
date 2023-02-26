import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:meddly/features/medicine/medicine.dart';

class MedicineBody extends ConsumerWidget {
  const MedicineBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicines = ref.watch(medicinesStreamProvider);

    return AsyncValueWidget(
        value: medicines,
        builder: (res) {
          if (res.isLeft()) {
            return AsyncValueWidget.errorWidget(res.asRight().toString());
          }
          final medicines = res.asRight();

          return Padding(
            padding: Sizes.padding,
            child: ListView.separated(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                return ProviderScope(
                  overrides: [
                    medicineProvider.overrideWithValue(medicine),
                  ],
                  child: MedicineCard(),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: Sizes.mediumSpacing),
            ),
          );
        });
  }
}
