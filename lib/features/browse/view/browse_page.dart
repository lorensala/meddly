import 'package:flutter/material.dart';
import 'package:meddly/features/browse/widgets/browse_body.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  static const routeName = '/browse';

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

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BrowseBody();
  }
}
