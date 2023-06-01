import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/sign_up/widgets/widgets.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: Sizes.mediumPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SignUpEmailInput(),
          SizedBox(height: Sizes.medium),
          SignUpPasswordInput(),
          SizedBox(height: Sizes.medium),
          TermsAndConditions(),
          SizedBox(height: Sizes.medium),
          SignUpButton(),
        ],
      ),
    );
  }
}
