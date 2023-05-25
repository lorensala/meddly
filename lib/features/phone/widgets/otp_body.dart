import 'package:flutter/material.dart';
import 'package:meddly/features/phone/widgets/otp_form.dart';

/// {@template otp_body}
/// Body of the OtpPage.
///
/// Displays the OtpForm and the OtpButton
/// {@endtemplate}
class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: OtpForm());
  }
}
