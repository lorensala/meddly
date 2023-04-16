import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/helpers.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/setup/setup.dart';
import 'package:meddly/router/provider/go_router_provider.dart';

/// {@template phone_page}
/// A description for PhonePage
/// {@endtemplate}
class PhonePage extends StatelessWidget {
  /// {@macro phone_page}
  const PhonePage({super.key});

  static const String routeName = '/phone';

  /// The static route for PhonePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PhonePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
      ),
      body: const PhoneView(),
    );
  }
}

/// {@template phone_view}
/// Displays the Body of PhoneView
/// {@endtemplate}
class PhoneView extends ConsumerWidget {
  /// {@macro phone_view}
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(phoneControllerProvider, (_, state) {
      state.whenOrNull(
          otpVerified: () =>
              ref.read(goRouterProvider).go(SetupSuccessPage.routeName),
          error: (err) => showSnackBar(context, err.toString()));
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const PhoneBody(),
    );
  }
}
