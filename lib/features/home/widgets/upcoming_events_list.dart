import 'package:flutter/material.dart';
import 'package:meddly/features/home/home.dart';

class UpcomingEventsList extends ConsumerWidget {
  const UpcomingEventsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.shrink();
    // final todayEvents = ref.watch(calendarTodayEventsProvider);

    // if (todayEvents.isEmpty) return _NoEvents();

    // return SizedBox(
    //   height: 200,
    //   child: Padding(
    //     padding: Sizes.horizontalPadding,
    //     child: ListView.separated(
    //       itemCount: todayEvents.length,
    //       scrollDirection: Axis.horizontal,
    //       physics: const NeverScrollableScrollPhysics(),
    //       itemBuilder: (context, index) {
    //         final event = todayEvents[index];

    //         return ProviderScope(overrides: [
    //           eventProvider.overrideWithValue(event),
    //         ], child: EventCard());
    //       },
    //       separatorBuilder: (BuildContext context, int index) =>
    //           SizedBox(height: Sizes.mediumSpacing),
    //     ),
    //   ),
    // );
  }
}

class _NoEvents extends StatelessWidget {
  const _NoEvents();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No events for today'));
  }
}
