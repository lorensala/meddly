import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/features/forgot_password/widgets/forgot_password_form.dart';

import '../../../core/core.dart';

/// {@template forgot_password_body}
/// Body of the ForgotPasswordPage.
///
/// Add what it does
/// {@endtemplate}
class ForgotPasswordBody extends StatelessWidget {
  /// {@macro forgot_password_body}
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: SizedBox(
        height: context.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: Sizes.medium),
            Flexible(child: SvgPicture.asset(Vectors.forgotPassword)),
            const ForgotPasswordForm(),
            const SizedBox(height: Sizes.medium),
          ],
        ),
      ),
    );
  }
}
