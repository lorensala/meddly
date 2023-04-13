import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';

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
            borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
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
