import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

// TODO(lorenzo): Add diferent colors and icons for each feature
class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.onPressed,
    required this.name,
  });

  final VoidCallback onPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
        ),
        child: Padding(
          padding: Sizes.mediumPadding,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.background,
                    borderRadius:
                        BorderRadius.circular(Sizes.mediumBorderRadius),
                  ),
                ),
                Text(name)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
