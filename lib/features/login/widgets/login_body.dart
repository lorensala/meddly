import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/login/login.dart';
import 'package:meddly/features/login/widgets/login_form.dart';

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
        return const Padding(
          padding: Sizes.padding,
          child: Center(child: LoginForm()),
        );
      },
    );
  }
}
