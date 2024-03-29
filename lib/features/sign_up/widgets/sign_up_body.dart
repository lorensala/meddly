import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/sign_up/widgets/widgets.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
            Flexible(child: SvgPicture.asset(Vectors.signUp)),
            const SizedBox(height: Sizes.extraLarge),
            const SignUpForm(),
            const SizedBox(height: Sizes.medium),
            const AlreadyHaveAnAccountLogin(),
            const SizedBox(height: Sizes.medium),
          ],
        ),
      ),
    );
  }
}
