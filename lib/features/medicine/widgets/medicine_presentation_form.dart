import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';

class MedicinePresentationForm extends StatelessWidget {
  const MedicinePresentationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: ColoredBox(
        color: context.colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.medium),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MedicineVector(vector: Vectors.medicinePresentation),
              const SizedBox(
                height: Sizes.large,
                width: double.infinity,
              ),
              const InputLabel(
                label: 'Seleccione la presentación  del medicamento',
                isRequired: true,
              ),
              const SizedBox(
                height: Sizes.large,
                width: double.infinity,
              ),
              MedicinePresentationList(
                presentations: MedicinePresentation.common,
                isCommon: true,
              ),
              const SizedBox(
                height: Sizes.medium,
                width: double.infinity,
              ),
              MedicinePresentationList(
                presentations: MedicinePresentation.uncommon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
