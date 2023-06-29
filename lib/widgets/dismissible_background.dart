import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/theme/theme.dart';

class DismissibleBackground extends StatelessWidget {
  const DismissibleBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.onBackground.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.only(left: Sizes.medium),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(
            Vectors.archive,
            colorFilter: ColorFilter.mode(
              context.colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class DismissibleBackgroundVariant extends StatelessWidget {
  const DismissibleBackgroundVariant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.success,
      child: Padding(
        padding: const EdgeInsets.only(left: Sizes.medium),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(
            Vectors.archive,
            colorFilter: ColorFilter.mode(
              context.colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class DismissibleDeleteBackground extends StatelessWidget {
  const DismissibleDeleteBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.error,
      child: Padding(
        padding: const EdgeInsets.only(right: Sizes.medium),
        child: Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            Vectors.trash,
            colorFilter: ColorFilter.mode(
              context.colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
