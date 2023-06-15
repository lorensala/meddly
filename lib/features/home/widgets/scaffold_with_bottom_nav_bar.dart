// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:meddly/features/home/home.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({
    required this.child,
    super.key,
  });

  static const String routeName = '/';

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
