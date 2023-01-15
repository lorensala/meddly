import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/theme/theme.dart';
import 'package:meddly/utils/extensions.dart';

class CircleCheckSuffixIcon extends StatelessWidget {
  const CircleCheckSuffixIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.padding,
      child: ElasticIn(
        duration: const Duration(milliseconds: 300),
        child: SvgPicture.asset(
          Assets.success,
          color: context.colorScheme.success,
        ),
      ),
    );
  }
}
