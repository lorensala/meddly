import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(Sizes.medium),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EmailInput(),
          SizedBox(height: Sizes.medium),
          PasswordInput(),
          SizedBox(height: Sizes.medium),
          ForgotPassword(),
          SizedBox(height: Sizes.medium),
          LoginButton(),
        ],
      ),
    );
  }
}
