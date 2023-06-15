import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/theme/app_theme.dart';

class CircleCheckSuffixIcon extends StatelessWidget {
  const CircleCheckSuffixIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.medium),
      child: ElasticIn(
        duration: const Duration(milliseconds: 300),
        child: SvgPicture.asset(
          Assets.success,
          theme: SvgTheme(
            currentColor: context.colorScheme.success,
          ),
        ),
      ),
    );
  }
}
