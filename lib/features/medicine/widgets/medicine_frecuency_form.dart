import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/l10n/l10n.dart';

class MedicineFrecuencyForm extends StatelessWidget {
  const MedicineFrecuencyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: Sizes.mediumPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: SvgPicture.asset(Vectors.birthdate)),
            const SizedBox(height: Sizes.large),
            FormTitle(
              title: context.l10n.howOftenDoYouWantToTakeThisMedicine,
              isRequired: true,
            ),
            const SizedBox(height: Sizes.large),
            const MedicineFrecuencySelector(),
            const SizedBox(height: Sizes.large),
          ],
        ),
      ),
    );
  }
}
