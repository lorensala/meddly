import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.horizontalPadding,
      child: Text(
        title,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
