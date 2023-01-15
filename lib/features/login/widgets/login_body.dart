import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/cubit/cubit.dart';
import 'package:meddly/features/login/widgets/login_form.dart';
import 'package:meddly/features/sign_up/view/view.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/utils/extensions.dart';

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
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: Sizes.padding,
          child: Column(
            children: const [
              Center(child: LoginForm()),
              SizedBox(height: Sizes.spacing),
              _DontHaveAccountSignUp(),
            ],
          ),
        );
      },
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
