import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/login.dart';
import 'package:meddly/features/sign_up/widgets/sign_up_form.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template sign_up_body}
/// Body of the SignUpPage.
///
/// Add what it does
/// {@endtemplate}
class SignUpBody extends StatelessWidget {
  /// {@macro sign_up_body}
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.padding,
      child: Column(
        children: const [
          SignUpForm(),
          SizedBox(height: Sizes.mediumSpacing),
          _AlreadyHaveAnAccountLogin(),
        ],
      ),
    );
  }
}

class _AlreadyHaveAnAccountLogin extends StatelessWidget {
  const _AlreadyHaveAnAccountLogin();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '${context.l10n.alreadyHaveAnAccount} ',
        children: [
          TextSpan(
            text: context.l10n.login,
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
                  Navigator.of(context).pushReplacement(LoginPage.route()),
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
