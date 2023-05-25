import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/widgets/widgets.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

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
            Flexible(child: SvgPicture.asset(Vectors.login)),
            const SizedBox(height: Sizes.extraLarge),
            const LoginForm(),
            const SizedBox(height: Sizes.medium),
            const DontHaveAccountSignUp(),
            const SizedBox(height: Sizes.medium),
          ],
        ),
      ),
    );
  }
}
