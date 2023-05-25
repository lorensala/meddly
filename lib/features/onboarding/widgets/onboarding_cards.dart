import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/onboarding/widgets/widgets.dart';
import 'package:meddly/l10n/l10n.dart';

class OnBoardingCards extends StatelessWidget {
  const OnBoardingCards({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnboardingCard(
        asset: Vectors.onboarding1,
        description: context.l10n.guidanceConsultationDescription,
        title: context.l10n.guidanceConsultationTitle,
      ),
      OnboardingCard(
        asset: Vectors.onboarding2,
        description: context.l10n.registerMedicationsDescription,
        title: context.l10n.registerMedicationsTitle,
      ),
      OnboardingCard(
        asset: Vectors.onboarding3,
        description: context.l10n.followYourTreatmentsDescription,
        title: context.l10n.followYourTreatmentsTitle,
      )
    ];

    return Expanded(
      flex: 5,
      child: PageView.builder(
        controller: pageController,
        itemBuilder: (BuildContext context, int index) {
          return pages[index % 3];
        },
      ),
    );
  }
}
