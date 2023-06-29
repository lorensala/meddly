import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashBody extends ConsumerWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: RepaintBoundary(child: CircularProgressIndicator.adaptive()),
    );
  }
}
