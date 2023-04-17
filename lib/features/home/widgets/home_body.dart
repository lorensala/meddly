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
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Sizes.mediumPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UserGreetings(),
                  const Spacer(),
                  const NotificationsButton(),
                ],
              ),
            ),
            // const SizedBox(height: Sizes.medium),
            // const HomeTitle(title: 'Upcoming events'),
            // const SizedBox(height: Sizes.medium),
            // const UpcomingEventsList(),
            // const SizedBox(height: Sizes.medium),
            // const SizedBox(height: Sizes.medium),
            // const HomeTitle(title: 'Your last predictions'),
            // const YourLastPredictions()
          ],
        ),
      ),
    );
  }
}

// class YourLastPredictions extends StatelessWidget {
//   const YourLastPredictions({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: Sizes.horizontalPadding,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: Sizes.medium),
//           ListView(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PredictionCard extends StatelessWidget {
//   const PredictionCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: Sizes.mediumPadding,
//       decoration: BoxDecoration(
//         color: context.colorScheme.secondary,
//         borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
//       ),
//       child: Row(
//         children: [
//           DecoratedBox(
//             decoration: BoxDecoration(
//               color: context.colorScheme.background,
//               borderRadius: BorderRadius.circular(Sizes.mediumBorderRadius),
//             ),
//             child: const SizedBox(
//               height: 48,
//               width: 48,
//             ),
//           ),
//           const SizedBox(width: Sizes.medium),
//           Text(
//             'Fiebre',
//             style: context.textTheme.bodyLarge,
//           ),
//           const Spacer(),
//           // chevron right
//           const SizedBox(
//             height: 48,
//             width: 48,
//             child: Icon(Icons.chevron_right),
//           ),
//         ],
//       ),
//     );
//   }
// }
