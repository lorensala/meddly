import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/onboarding/widgets/widgets.dart';

class OnboardingPageIndicators extends StatelessWidget {
  const OnboardingPageIndicators({
    super.key,
    required this.currentPage,
  });

  final int currentPage;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: Sizes.medium),
            PageIndicator(isCurrentPage: currentPage == 0),
            const SizedBox(width: Sizes.medium),
            PageIndicator(isCurrentPage: currentPage == 1),
            const SizedBox(width: Sizes.medium),
            PageIndicator(isCurrentPage: currentPage == 2),
          ],
        ),
      ],
    );
  }
}
