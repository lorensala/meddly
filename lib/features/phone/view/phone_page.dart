import 'package:flutter/material.dart';
import 'package:meddly/features/phone/phone.dart';

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
    return Scaffold(
      appBar: AppBar(),
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
    ref.listen(phoneControllerProvider, (_, state) {
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PhoneBody(),
    );
  }
}
