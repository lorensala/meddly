import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/phone/phone.dart';
import 'package:meddly/features/setup/widgets/setup_body.dart';
import 'package:meddly/features/user/user.dart';

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
class SetupView extends ConsumerWidget {
  /// {@macro setup_view}
  const SetupView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userControllerProvider, (_, state) {
      state.whenOrNull(
        data: (_) {
          Navigator.of(context)
              .pushAndRemoveUntil(PhonePage.route(), (route) => false);
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const SetupBody(),
    );
  }
}
