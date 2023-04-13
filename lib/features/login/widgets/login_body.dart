import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/widgets/login_form.dart';
import 'package:meddly/features/sign_up/view/view.dart';
import 'package:meddly/l10n/l10n.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Sizes.medium),
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
              child: SvgPicture.asset(Vectors.login)),
          const SizedBox(height: Sizes.extraLarge),
          const LoginForm(),
          const SizedBox(height: Sizes.medium),
          const _DontHaveAccountSignUp(),
          const SizedBox(height: Sizes.medium),
        ],
      ),
    );
  }
}

class _DontHaveAccountSignUp extends StatelessWidget {
  const _DontHaveAccountSignUp();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '${context.l10n.dontHaveAnAccount} ',
        children: [
          TextSpan(
            text: context.l10n.signUp,
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.of(context).pushReplacement(
                    SignUpPage.route(),
                  ),
            style: TextStyle(
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
