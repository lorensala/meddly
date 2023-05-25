import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/sign_up/view/sign_up_page.dart';
import 'package:meddly/l10n/l10n.dart';

class DontHaveAccountSignUp extends StatelessWidget {
  const DontHaveAccountSignUp({super.key});

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
