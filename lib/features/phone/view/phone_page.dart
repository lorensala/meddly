import 'package:flutter/material.dart';
import 'package:meddly/features/phone/bloc/bloc.dart';
import 'package:meddly/features/phone/view/otp_page.dart';
import 'package:meddly/features/phone/widgets/phone_body.dart';
import 'package:meddly/features/user/user.dart';

/// {@template phone_page}
/// A description for PhonePage
/// {@endtemplate}
class PhonePage extends StatelessWidget {
  /// {@macro phone_page}
  const PhonePage({super.key});

  /// The static route for PhonePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PhonePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PhoneView(),
    );
  }
}

/// {@template phone_view}
/// Displays the Body of PhoneView
/// {@endtemplate}
class PhoneView extends StatelessWidget {
  /// {@macro phone_view}
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneBloc, PhoneState>(
      listener: (context, state) {
        state.whenOrNull(
          codeSentSuccess: (
            _,
            __,
          ) =>
              Navigator.of(context).push(OtpPage.route()),
          verificated: () => Navigator.of(context).push(UserPage.route()),
        );
      },
      child: const PhoneBody(),
    );
  }
}
