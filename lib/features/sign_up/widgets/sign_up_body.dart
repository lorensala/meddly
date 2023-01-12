import 'package:flutter/material.dart';
import 'package:meddly/features/sign_up/cubit/cubit.dart';

/// {@template sign_up_body}
/// Body of the SignUpPage.
///
/// Add what it does
/// {@endtemplate}
class SignUpBody extends StatelessWidget {
  /// {@macro sign_up_body}
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Center(child: Text('${state.status}'));
      },
    );
  }
}
