import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/bloc/bloc.dart';
import 'package:meddly/features/calendar/widgets/widgets.dart';

/// {@template calendar_body}
/// Body of the CalendarPage.
///
/// Add what it does
/// {@endtemplate}
class CalendarBody extends StatelessWidget {
  /// {@macro calendar_body}
  const CalendarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return Column(
          children: const [
            CalendarDateAndDayIndicator(),
            CalendarDayList(),
            SizedBox(height: Sizes.mediumSpacing),
            CalendarList(),
            // Expanded(
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       color: context.colorScheme.secondary,
            //       borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(Sizes.largeSpacing),
            //         topRight: Radius.circular(Sizes.largeSpacing),
            //       ),
            //     ),
            //     child: Column(
            //       children: [
            //         const SizedBox(height: Sizes.mediumSpacing),
            //         SizedBox(
            //           height: 5,
            //           width: 100,
            //           child: DecoratedBox(
            //             decoration: BoxDecoration(
            //               color: context.colorScheme.background,
            //               borderRadius: const BorderRadius.all(
            //                 Radius.circular(Sizes.borderRadius),
            //               ),
            //             ),
            //           ),
            //         ),
            //         const SizedBox(height: Sizes.mediumSpacing),
            //         Expanded(
            //           child: ListView.builder(
            //             shrinkWrap: true,
            //             itemCount:,
            //             itemBuilder: (context, index) {
            //               return Container();
            //             },
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        );
      },
    );
  }
}
