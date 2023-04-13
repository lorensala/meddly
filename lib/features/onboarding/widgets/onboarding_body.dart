import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/onboarding/widgets/widgets.dart';

/// {@template onboarding_body}
/// Body of the OnboardingPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingBody extends HookWidget {
  /// {@macro onboarding_body}
  const OnboardingBody({super.key});

  static const _timerDuration = Duration(seconds: 9);
  static const _pageAnimationDuration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final currentPage = useState(0);
    final pageController = usePageController();

    useEffect(
      () {
        pageController.addListener(() {
          currentPage.value = pageController.page!.round() % 3;
        });
        final timer = Timer.periodic(_timerDuration, (timer) {
          pageController.nextPage(
            duration: _pageAnimationDuration,
            curve: Curves.easeInOut,
          );
        });

        return timer.cancel;
      },
      [currentPage.value],
    );

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnBoardingCards(pageController: pageController),
          const SizedBox(height: Sizes.large),
          OnboardingPageIndicators(currentPage: currentPage.value),
          const SizedBox(height: Sizes.large),
          OnboardingLoginButtons()
        ],
      ),
    );
  }
}
