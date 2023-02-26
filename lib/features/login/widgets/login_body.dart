import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/widgets/login_form.dart';
import 'package:meddly/features/sign_up/view/view.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}
class LoginBody extends StatelessWidget {
  /// {@macro login_body}
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Center(child: LoginForm()),
          SizedBox(height: Sizes.mediumSpacing),
          _DontHaveAccountSignUp(),
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
