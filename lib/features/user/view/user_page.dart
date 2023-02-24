import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/user/user.dart';

/// {@template user_page}
/// A description for UserPage
/// {@endtemplate}
class UserPage extends StatelessWidget {
  /// {@macro user_page}
  const UserPage({super.key});

  /// The static route for UserPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const UserPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: const UserView(),
    );
  }
}

/// {@template user_view}
/// Displays the Body of UserView
/// {@endtemplate}
class UserView extends ConsumerWidget {
  /// {@macro user_view}
  const UserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const UserBody();
  }
}
