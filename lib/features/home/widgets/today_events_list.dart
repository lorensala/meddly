import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:meddly/features/home/home.dart';

class TodayEventsList extends ConsumerWidget {
  const TodayEventsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayEvents = ref.watch(calendarTodayEventsProvider);

    if (todayEvents.isEmpty) return _NoEvents();

    final lenght = todayEvents.length > 2 ? 3 : todayEvents.length + 1;

    return Padding(
      padding: Sizes.horizontalPadding,
      child: ListView.separated(
        itemCount: lenght,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == lenght - 1) {
            return Align(
                alignment: Alignment.centerRight, child: Text('See all'));
          }
          final event = todayEvents[index];

          return ProviderScope(overrides: [
            eventProvider.overrideWithValue(event),
          ], child: EventCard());
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: Sizes.mediumSpacing),
      ),
    );
  }
}

class _NoEvents extends StatelessWidget {
  const _NoEvents();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No events for today'));
  }
}
