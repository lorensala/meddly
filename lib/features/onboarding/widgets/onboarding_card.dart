import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meddly/core/core.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    required this.asset,
    required this.title,
    required this.description,
    super.key,
  });

  final String asset;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.medium),
      child: Column(
        children: [
          const SizedBox(height: Sizes.medium),
          Flexible(child: SvgPicture.asset(asset)),
          const SizedBox(height: Sizes.extraLarge),
          Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Sizes.small),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onBackground.withOpacity(0.5),
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
