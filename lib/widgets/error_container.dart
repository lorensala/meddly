import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    super.key,
    required this.message,
    this.onRetry,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: SvgPicture.asset(Vectors.error)),
          const SizedBox(height: Sizes.medium),
          Text(
            message,
            style: context.textTheme.titleMedium!.copyWith(
              color: context.colorScheme.onSecondary.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: Sizes.medium),
          TextButton(
            onPressed: onRetry,
            child: Text(
              context.l10n.tryAgain,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
