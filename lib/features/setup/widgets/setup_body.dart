import 'package:flutter/material.dart';
import 'package:meddly/features/setup/widgets/setup_form.dart';

/// {@template setup_body}
/// Body of the SetupPage.
///
/// Add what it does
/// {@endtemplate}
class SetupBody extends StatelessWidget {
  /// {@macro setup_body}
  const SetupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: SetupForm(),
      ),
    );
  }
}
