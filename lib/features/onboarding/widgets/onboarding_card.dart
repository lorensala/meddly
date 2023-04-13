import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.asset,
    required this.title,
    required this.description,
  });

  final String asset;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.mediumPadding,
      child: Column(
        children: [
          Expanded(child: SvgPicture.asset(asset)),
          const SizedBox(height: Sizes.extraLarge),
          Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Sizes.medium),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSecondary.withOpacity(0.5),
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
