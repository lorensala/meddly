import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meddly/features/sign_up/cubit/cubit.dart';
import 'package:meddly/features/sign_up/widgets/sign_up_body.dart';

/// {@template sign_up_page}
/// A description for SignUpPage
/// {@endtemplate}
class SignUpPage extends StatelessWidget {
  /// {@macro sign_up_page}
  const SignUpPage({super.key});

  /// The static route for SignUpPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(GetIt.I<AuthRepository>()),
      child: const Scaffold(
        body: SignUpView(),
      ),
    );
  }
}

/// {@template sign_up_view}
/// Displays the Body of SignUpView
/// {@endtemplate}
class SignUpView extends StatelessWidget {
  /// {@macro sign_up_view}
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpBody();
  }
}
