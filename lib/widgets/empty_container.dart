import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({
    required this.message,
    this.onRetry,
    this.size,
    super.key,
    this.isFlex = true,
  });

  final String message;
  final VoidCallback? onRetry;
  final bool isFlex;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isFlex)
            Flexible(child: SvgPicture.asset(Vectors.empty))
          else
            SvgPicture.asset(
              Vectors.empty,
              height: size,
            ),
          const SizedBox(height: Sizes.medium),
          Text(
            message,
            style: context.textTheme.titleMedium!.copyWith(
              color: context.colorScheme.onSecondary.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
