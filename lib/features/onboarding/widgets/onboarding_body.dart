import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/login.dart';
import 'package:meddly/features/onboarding/widgets/widgets.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

/// {@template onboarding_body}
/// Body of the OnboardingPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingBody extends HookWidget {
  /// {@macro onboarding_body}
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPage = useState(0);
    final pageController = usePageController();

    useEffect(
      () {
        pageController.addListener(() {
          currentPage.value = pageController.page!.round() % 3;
        });
        final timer = Timer.periodic(const Duration(seconds: 9), (timer) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
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
          const Spacer(),
          OnBoardingCards(pageController: pageController),
          const Spacer(),
          PageIndicators(currentPage: currentPage.value),
          const SizedBox(height: 20),
          Container(
            padding: Sizes.padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const GoogleButton(),
                const SizedBox(height: 20),
                Button(
                  label: context.l10n.loginWithEmailAddress,
                  onPressed: () =>
                      Navigator.of(context).push(LoginPage.route()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
