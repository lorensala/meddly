import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/user/user.dart';

/// {@template user_page}
/// A description for UserPage
/// {@endtemplate}
class UserPage extends StatefulWidget {
  /// {@macro user_page}
  const UserPage({super.key});

  /// The static route for UserPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const UserPage());
  }

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(const UserEvent.checkIfUserExists());
    super.initState();
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
