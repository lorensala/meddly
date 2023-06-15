import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
      child: Text(
        title,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
