import 'package:flutter/material.dart';
import 'package:meddly/features/home/home.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const HomeBody();
  }
}
