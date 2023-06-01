import 'package:flutter/material.dart';
import 'package:meddly/features/home/home.dart';

class SplashBody extends ConsumerWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: RepaintBoundary(child: CircularProgressIndicator.adaptive()),
    );
  }
}
