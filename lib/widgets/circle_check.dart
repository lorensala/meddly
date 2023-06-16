import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/theme/theme.dart';

class CircleCheck extends StatelessWidget {
  const CircleCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        child: SvgPicture.asset(
          Vectors.checkCircle,
          colorFilter: ColorFilter.mode(
            context.colorScheme.success,
            BlendMode.srcIn,
          ),
          fit: BoxFit.scaleDown,
        ),
      ),
    ).animate().fadeIn();
  }
}
