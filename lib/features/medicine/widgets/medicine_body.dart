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

class MedicineCard extends ConsumerWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicine = ref.watch(medicineProvider);
    return ListTile(
      title: Text(medicine.name),
      leading: SizedBox(
        height: 48,
        width: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(Sizes.borderRadius),
          ),
        ),
      ),
      subtitle: Text(
        '${medicine.dosis} ${medicine.dosisUnit.value}',
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.onSecondary.withOpacity(0.7),
        ),
      ),
    );
  }
}
