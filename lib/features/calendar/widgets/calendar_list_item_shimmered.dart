import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';

class CalendarListItemShimmered extends StatelessWidget {
  const CalendarListItemShimmered({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.horizontalPadding,
      child: Row(
        children: [
          ShimmeredContainer(
            height: 20,
            width: context.width * 0.1,
            borderRadius: Sizes.extraSmall,
          ),
          const SizedBox(width: Sizes.medium),
          Expanded(
            child: ShimmeredContainer(
              height: 80,
              width: context.width * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmeredContainer extends StatelessWidget {
  const ShimmeredContainer({
    required this.height,
    required this.width,
    this.borderRadius = Sizes.small,
    super.key,
  });

  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: context.colorScheme.surface,
        ),
      ).customShimmer(),
    );
  }
}
