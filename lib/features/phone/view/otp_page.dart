import 'package:flutter/material.dart';
import 'package:meddly/features/phone/bloc/bloc.dart';
import 'package:meddly/features/phone/widgets/otp_body.dart';
import 'package:meddly/l10n/l10n.dart';

/// {@template otp_page}
/// A description for OtpPage
/// {@endtemplate}
class OtpPage extends StatelessWidget {
  /// {@macro otp_page}
  const OtpPage({super.key});

  /// The static route for OtpPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const OtpPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OtpView(),
    );
  }
}

/// {@template otp_view}
/// Displays the Body of OtpView
/// {@endtemplate}
class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneBloc, PhoneState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (_, failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    failure.maybeWhen(
                      orElse: () => context.l10n.unknownError,
                      invalidPhoneNumber: () => context.l10n.invalidPhoneNumber,
                      serverError: () => context.l10n.serverError,
                      invalidVerificationCode: () =>
                          context.l10n.invalidVerificationCode,
                      operationNotAllowed: () =>
                          context.l10n.operationNotAllowed,
                      userDisabled: () => context.l10n.userDisabled,
                      userNotFound: () => context.l10n.userNotFound,
                      tooManyRequests: () => context.l10n.tooManyRequests,
                    ),
                  ),
                ),
              );
          },
        );
      },
      child: const OtpBody(),
    );
  }
}
