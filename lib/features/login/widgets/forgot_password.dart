import 'package:flutter/material.dart';
import 'package:meddly/features/forgot_password/forgot_password.dart';
import 'package:meddly/l10n/l10n.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(ForgotPasswordPage.route()),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
          context.l10n.forgotPassword,
        ),
      ),
    );
  }
}
