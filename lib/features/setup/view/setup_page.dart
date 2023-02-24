import 'package:flutter/material.dart';
import 'package:meddly/features/setup/widgets/setup_body.dart';

/// {@template setup_page}
/// A description for SetupPage
/// {@endtemplate}
class SetupPage extends StatelessWidget {
  /// {@macro setup_page}
  const SetupPage({super.key});

  /// The static route for SetupPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SetupPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup'),
      ),
      body: const SetupView(),
    );
  }
}

/// {@template setup_view}
/// Displays the Body of SetupView
/// {@endtemplate}
class SetupView extends StatelessWidget {
  /// {@macro setup_view}
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocListener<SetupCubit, SetupState>(
    //   listener: (context, state) {
    //     if (state.status.isSubmissionSuccess) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(
    //           content: Text(
    //             'User created successfully!',
    //           ),
    //         ),
    //       );
    //       Navigator.of(context)
    //           .pushAndRemoveUntil(UserPage.route(), (_) => false);
    //     }
    //     if (state.status.isSubmissionFailure) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           content: Text(
    //             state.failure!.maybeWhen(
    //               notFound: () => context.l10n.userNotFound,
    //               timeout: () => context.l10n.timeout,
    //               sendTimeout: () => context.l10n.timeout,
    //               receiveTimeout: () => context.l10n.timeout,
    //               orElse: () => context.l10n.unknownError,
    //             ),
    //           ),
    //         ),
    //       );
    //     }
    //   },
    //   child:
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const SetupBody(),
    );
  }
}
