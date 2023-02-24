import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/home/provider/provider.dart';
import 'package:meddly/features/home/widgets/widgets.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends ConsumerWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: Sizes.padding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AvatarAndSettings(),
              const SizedBox(height: Sizes.largeSpacing),
              const UserGreetings(),
              const SizedBox(height: Sizes.largeSpacing),
              Text(
                'Today events',
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(height: Sizes.mediumSpacing),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: Sizes.padding,
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(Sizes.borderRadius),
                    ),
                    child: Row(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.colorScheme.background,
                            borderRadius:
                                BorderRadius.circular(Sizes.borderRadius),
                          ),
                          child: const SizedBox(
                            height: 48,
                            width: 48,
                            child: Icon(
                              Icons.medication_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: Sizes.mediumSpacing),
                        Text(
                          'Ibuprofeno',
                          style: context.textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        // chevron right
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.colorScheme.background,
                              borderRadius:
                                  BorderRadius.circular(Sizes.borderRadius),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                Assets.chevron,
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Sizes.mediumSpacing),
              const Features(),
              const SizedBox(height: Sizes.mediumSpacing),
              const YourLastPredictions()
            ],
          ),
        ),
      ),
    );
  }
}

class YourLastPredictions extends StatelessWidget {
  const YourLastPredictions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your last predictions',
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(height: Sizes.mediumSpacing),
        ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: const [
            PredictionCard(),
            SizedBox(height: Sizes.mediumSpacing),
            PredictionCard(),
            SizedBox(height: Sizes.mediumSpacing),
            PredictionCard(),
          ],
        ),
      ],
    );
  }
}

class PredictionCard extends StatelessWidget {
  const PredictionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sizes.padding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.borderRadius),
      ),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              borderRadius: BorderRadius.circular(Sizes.borderRadius),
            ),
            child: const SizedBox(
              height: 48,
              width: 48,
              child: Icon(
                Icons.medical_information_rounded,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: Sizes.mediumSpacing),
          Text(
            'Fiebre',
            style: context.textTheme.bodyLarge,
          ),
          const Spacer(),
          // chevron right
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              borderRadius: BorderRadius.circular(Sizes.borderRadius),
            ),
            child: const SizedBox(
              height: 48,
              width: 48,
              child: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}
