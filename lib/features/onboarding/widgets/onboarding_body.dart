import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/login.dart';
import 'package:meddly/features/onboarding/cubit/cubit.dart';
import 'package:meddly/features/onboarding/widgets/widgets.dart';
import 'package:meddly/features/sign_up/cubit/cubit.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

/// {@template onboarding_body}
/// Body of the OnboardingPage.
///
/// Add what it does
/// {@endtemplate}
class OnboardingBody extends StatefulWidget {
  /// {@macro onboarding_body}
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  late final PageController _pageController;
  late final Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round() % 3;
      });
    });
    _timer = Timer.periodic(const Duration(seconds: 9), (timer) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          OnBoardingCards(pageController: _pageController),
          const Spacer(),
          PageIndicators(currentPage: _currentPage),
          const SizedBox(height: 20),
          Container(
            padding: Sizes.padding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GoogleButton(
                  onPressed: () =>
                      context.read<OnboardingCubit>().logInWithGoogle(),
                ),
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

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }
}
