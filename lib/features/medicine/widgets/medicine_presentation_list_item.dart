import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:medicine/medicine.dart';

class MedicinePresentationListItem extends ConsumerWidget {
  const MedicinePresentationListItem(
    this.presentation, {
    super.key,
  });

  final MedicinePresentation presentation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(medicineFormControllerProvider.notifier);
    final selectedPresentation =
        ref.watch(medicineFormControllerProvider.select((s) => s.presentation));

    return ListTile(
      selected: selectedPresentation == presentation,
      title: Text(presentation.name.capitalize()),
      trailing:
          selectedPresentation == presentation ? const Icon(Icons.check) : null,
      onTap: () => notifier.presentationChanged(presentation),
    );
  }
}
