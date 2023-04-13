import 'package:flutter/material.dart';
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Sizes.mediumPadding,
              child: Row(
                children: [
                  UserAvatar(),
                  const Spacer(),
                  NotificationsButton(),
                  SizedBox(width: Sizes.mediumPadding.right),
                  SettingsButton(),
                ],
              ),
            ),
            SizedBox(height: Sizes.medium),
            UserGreetings(),
            SizedBox(height: Sizes.medium),
            HomeTitle(title: 'Upcoming events'),
            SizedBox(height: Sizes.medium),
            UpcomingEventsList(),
            SizedBox(height: Sizes.medium),
            // HomeTitle(title: 'Features'),
            // SizedBox(height: Sizes.mediumSpacing),
            // FeaturesList(),
            SizedBox(height: Sizes.medium),
            HomeTitle(title: 'Your last predictions'),
            YourLastPredictions()
          ],
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
    return Padding(
      padding: Sizes.horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Sizes.medium),
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: const [
              // PredictionCard(),
              // SizedBox(height: Sizes.mediumSpacing),
              // PredictionCard(),
              // SizedBox(height: Sizes.mediumSpacing),
              // PredictionCard(),
            ],
          ),
        ],
      ),
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
      padding: Sizes.mediumPadding,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
      ),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
            ),
            child: const SizedBox(
              height: 48,
              width: 48,
            ),
          ),
          const SizedBox(width: Sizes.medium),
          Text(
            'Fiebre',
            style: context.textTheme.bodyLarge,
          ),
          const Spacer(),
          // chevron right
          const SizedBox(
            height: 48,
            width: 48,
            child: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
