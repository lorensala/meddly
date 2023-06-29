import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineFrecuencyForm extends StatelessWidget {
  const MedicineFrecuencyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MedicineVector(vector: Vectors.birthdate),
            const SizedBox(height: Sizes.large),
            InputLabel(
              label: context.l10n.howOftenDoYouWantToTakeThisMedicine,
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
