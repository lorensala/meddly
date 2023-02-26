import 'package:flutter/material.dart';
import 'package:meddly/features/phone/widgets/phone_body.dart';
import 'package:meddly/features/user/user.dart';

import '../../home/home.dart';

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
class PhoneView extends ConsumerWidget {
  /// {@macro phone_view}
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) => ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(err.toString()),
            ),
          ),
        data: (_) => Navigator.of(context)
            .pushAndRemoveUntil(HomePage.route(), (route) => false),
      );
    });
    // return BlocListener<PhoneBloc, PhoneState>(
    //   listener: (context, state) {
    //     state.whenOrNull(
    //       error: (_, failure) {
    //         ScaffoldMessenger.of(context)
    //           ..hideCurrentSnackBar()
    //           ..showSnackBar(
    //             SnackBar(
    //               content: Text(
    //                 failure.maybeWhen(
    //                   orElse: () => context.l10n.unknownError,
    //                   invalidPhoneNumber: () => context.l10n.invalidPhoneNumber,
    //                   serverError: () => context.l10n.serverError,
    //                   invalidVerificationCode: () =>
    //                       context.l10n.invalidVerificationCode,
    //                   operationNotAllowed: () =>
    //                       context.l10n.operationNotAllowed,
    //                   userDisabled: () => context.l10n.userDisabled,
    //                   userNotFound: () => context.l10n.userNotFound,
    //                   tooManyRequests: () => context.l10n.tooManyRequests,
    //                 ),
    //               ),
    //             ),
    //           );
    //       },
    //       codeSentSuccess: (
    //         _,
    //         __,
    //       ) =>
    //           _pageController.nextPage(
    //         curve: Curves.easeIn,
    //         duration: const Duration(milliseconds: 300),
    //       ),
    //       verificated: () => Navigator.of(context).push(HomePage.route()),
    //     );
    //   },
    //   child:

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PhoneBody(),
    );
  }
}
