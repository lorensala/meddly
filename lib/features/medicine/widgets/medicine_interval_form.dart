import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/widgets/widgets.dart';

class MedicineIntervalForm extends StatelessWidget {
  const MedicineIntervalForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.medium),
      child: Column(
        children: [
          Flexible(child: SvgPicture.asset(Vectors.onboarding3)),
          const MedcineIntervalSelector(),
          const SizedBox(height: Sizes.extraLarge),
        ],
      ),
    );
  }
}
