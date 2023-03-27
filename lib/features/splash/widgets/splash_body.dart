import 'package:flutter/material.dart';
import 'package:meddly/features/home/home.dart';

import '../../user/user.dart';

/// {@template splash_body}
/// Body of the SplashPage.
///
/// Add what it does
/// {@endtemplate}
class SplashBody extends ConsumerWidget {
  /// {@macro splash_body}
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(checkIfUserExistProvider, (_, state) {
      state.whenOrNull(
        data: (data) {
          // data
          // ?
          Navigator.of(context)
              .pushAndRemoveUntil(HomePage.route(), (route) => false);
          // : Navigator.of(context)
          //     .pushAndRemoveUntil(SetupPage.route(), (route) => false);
        },
        error: (err, _) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(err.toString()),
              ),
            );
        },
      );
    });

    //TODO: Better loader..
    return const Center(
        child: RepaintBoundary(child: CircularProgressIndicator.adaptive()));
  }
}
