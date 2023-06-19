import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';

class MedicineIntervalForm extends StatelessWidget {
  const MedicineIntervalForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(Sizes.medium),
      child: Column(
        children: [
          MedicineVector(vector: Vectors.onboarding3),
          SizedBox(height: Sizes.large),
          MedcineIntervalSelector(),
          SizedBox(height: Sizes.extraLarge),
        ],
      ),
    );
  }
}
