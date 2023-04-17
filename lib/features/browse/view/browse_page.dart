import 'package:flutter/material.dart';
import 'package:meddly/features/browse/widgets/browse_body.dart';

/// {@template browse_page}
/// A description for BrowsePage
/// {@endtemplate}
class BrowsePage extends StatelessWidget {
  /// {@macro browse_page}
  const BrowsePage({super.key});

  static const routeName = '/browse';

  /// The static route for BrowsePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const BrowsePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BrowseView(),
    );
  }
}

/// {@template browse_view}
/// Displays the Body of BrowseView
/// {@endtemplate}
class BrowseView extends StatelessWidget {
  /// {@macro browse_view}
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BrowseBody();
  }
}
