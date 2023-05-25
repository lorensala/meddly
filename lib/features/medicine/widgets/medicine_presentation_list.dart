import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:medicine/medicine.dart';

class MedicinePresentationList extends StatelessWidget {
  const MedicinePresentationList({
    required this.presentations,
    required this.title,
    super.key,
    this.isInitiallyExpanded = false,
  });

  final List<MedicinePresentation> presentations;
  final String title;
  final bool isInitiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        boxShadow: Constants.boxShadow,
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isInitiallyExpanded,
          title: Text(title),
          children:
              presentations.map(MedicinePresentationListItem.new).toList(),
        ),
      ),
    );
  }
}
