import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:medicine/medicine.dart';

class MedicinePresentationForm extends StatelessWidget {
  const MedicinePresentationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: Sizes.mediumPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: context.colorScheme.secondary,
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 300, maxHeight: 300),
                child: SvgPicture.asset(Vectors.medicinePresentation),
              ),
            ),
            ColoredBox(
              color: context.colorScheme.secondary,
              child: const SizedBox(
                height: Sizes.large,
                width: double.infinity,
              ),
            ),
            ColoredBox(
              color: context.colorScheme.secondary,
              child: const FormTitle(
                title: 'Seleccione la presentación  del medicamento',
                isRequired: true,
              ),
            ),
            ColoredBox(
              color: context.colorScheme.secondary,
              child: const SizedBox(
                height: Sizes.large,
                width: double.infinity,
              ),
            ),
            MedicinePresentationList(
              presentations: MedicinePresentation.common,
              title: context.l10n.commonPresentations,
              isInitiallyExpanded: true,
            ),
            const ColoredBox(
              color: Colors.transparent,
              child: SizedBox(
                height: Sizes.medium,
                width: double.infinity,
              ),
            ),
            MedicinePresentationList(
              presentations: MedicinePresentation.uncommon,
              title: context.l10n.otherPresentations,
            ),
            const SizedBox(height: Sizes.medium),
          ],
        ),
      ),
    );
  }
}
