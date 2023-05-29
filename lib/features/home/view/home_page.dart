import 'package:flutter/material.dart';
import 'package:meddly/features/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
