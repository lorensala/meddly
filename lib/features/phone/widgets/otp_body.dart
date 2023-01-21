import 'package:flutter/material.dart';
import 'package:meddly/features/phone/cubit/otp_form_cubit.dart';
import 'package:meddly/features/phone/widgets/otp_form.dart';
import 'package:meddly/features/sign_up/cubit/cubit.dart';

/// {@template otp_body}
/// Body of the OtpPage.
///
/// Displays the OtpForm and the OtpButton
/// {@endtemplate}
class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpFormCubit(),
      child: const Center(child: OtpForm()),
    );
  }
}
