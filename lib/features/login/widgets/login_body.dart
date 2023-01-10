import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddly/features/login/login.dart';

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
        return const Center(child: Text(''));
      },
    );
  }
}
