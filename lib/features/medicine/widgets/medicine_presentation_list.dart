import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:medicine/medicine.dart';

class MedicinePresentationList extends StatelessWidget {
  const MedicinePresentationList({
    required this.presentations,
    this.isCommon = false,
    this.isSelected = false,
    super.key,
  });

  final List<MedicinePresentation> presentations;
  final bool isCommon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: boxShadow(context),
        borderRadius: BorderRadius.circular(Sizes.small),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isCommon,
          title: Consumer(
            builder: (context, ref, child) {
              final selected = ref.watch(
                medicineFormControllerProvider.select(
                  (controller) => controller.presentation,
                ),
              );
              return Text(
                isCommon
                    ? context.l10n.commonPresentations
                    : context.l10n.otherPresentations,
                style: context.textTheme.titleSmall?.copyWith(
                  color: (selected.isCommon && isCommon) ||
                          (!selected.isCommon && !isCommon)
                      ? context.colorScheme.primary
                      : null,
                ),
              );
            },
          ),
          children:
              presentations.map(MedicinePresentationListItem.new).toList(),
        ),
      ),
    );
  }
}
