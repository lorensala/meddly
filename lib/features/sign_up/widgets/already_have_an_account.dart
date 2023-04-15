import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/login.dart';
import 'package:meddly/l10n/l10n.dart';

class AlreadyHaveAnAccountLogin extends StatelessWidget {
  const AlreadyHaveAnAccountLogin({super.key});

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
