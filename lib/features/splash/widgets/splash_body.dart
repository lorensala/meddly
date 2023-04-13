import 'package:flutter/material.dart';
import 'package:meddly/features/home/home.dart';

/// {@template splash_body}
/// Body of the SplashPage.
///
/// Add what it does
/// {@endtemplate}
class SplashBody extends ConsumerWidget {
  /// {@macro splash_body}
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: Better loader..
    return const Center(
        child: RepaintBoundary(child: CircularProgressIndicator.adaptive()));
  }
}
