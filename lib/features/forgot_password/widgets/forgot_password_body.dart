import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/forgot_password/cubit/cubit.dart';
import 'package:meddly/features/forgot_password/widgets/forgot_password_form.dart';

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
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return const Center(
          child: Padding(
            padding: Sizes.padding,
            child: ForgotPasswordForm(),
          ),
        );
      },
    );
  }
}
