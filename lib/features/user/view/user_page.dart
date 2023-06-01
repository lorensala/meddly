import 'package:flutter/material.dart';
import 'package:meddly/features/user/user.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  static String get routeName => '/user';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserBody(),
    );
  }
}
