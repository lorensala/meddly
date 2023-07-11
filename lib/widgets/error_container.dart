import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/l10n/l10n.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({
    required this.message,
    this.onRetry,
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: Sizes.medium),
          Flexible(
            child: SvgPicture.asset(Vectors.error),
          ),
          const SizedBox(height: Sizes.medium),
          Text(
            message,
            style: context.textTheme.titleSmall!.copyWith(
              color: context.colorScheme.onSecondary.withOpacity(0.6),
            ),
          ),
          if (onRetry != null)
            TextButton(
              onPressed: onRetry,
              child: Text(
                context.l10n.tryAgain,
                style: context.textTheme.bodyMedium!
                    .copyWith(
                      color: context.colorScheme.primary,
                    )
                    .underlined(),
              ),
            ),
        ],
      ),
    );
  }
}
