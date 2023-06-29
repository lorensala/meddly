import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicineFilter extends StatelessWidget {
  const MedicineFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.medium),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Sizes.medium),
              ),
            ),
            useRootNavigator: true,
            builder: (context) => ProviderScope(
              parent: ProviderScope.containerOf(context),
              child: Consumer(
                builder: (context, ref, child) {
                  final selectedFilters =
                      ref.watch(medicinePresentationsProvider);
                  final notifier =
                      ref.read(medicinePresentationsProvider.notifier);

                  return FilterModal<MedicinePresentation>(
                    items: MedicinePresentation.values,
                    labelBuilder: (item) => item.localizedString(context.l10n),
                    selectedItems: selectedFilters,
                    onAllSelected: () =>
                        ref.invalidate(medicinePresentationsProvider),
                    onSelected: notifier.select,
                    onDeselected: notifier.deselect,
                    onCleanSelection: notifier.clear,
                  );
                },
              ),
            ),
          );
        },
        child: Stack(
          children: [
            SvgPicture.asset(Vectors.filterLines),
            Consumer(
              builder: (context, ref, child) {
                final selectedFilters =
                    ref.watch(medicinePresentationsProvider);
                return Visibility(
                  visible: selectedFilters.length !=
                      MedicinePresentation.values.length,
                  child: const Positioned(
                    right: 0,
                    top: 0,
                    child: Badge(
                      smallSize: Sizes.small,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
