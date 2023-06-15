import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/login.dart';
import 'package:meddly/features/onboarding/widgets/widgets.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class OnboardingLoginButtons extends StatelessWidget {
  const OnboardingLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.medium),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const GoogleButton(),
          const SizedBox(height: Sizes.medium),
          Button(
            prefix: Vectors.email,
            label: context.l10n.loginWithEmailAddress,
            onPressed: () => Navigator.of(context).push(LoginPage.route()),
          ),
        ],
      ),
    );
  }
}
