import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:meddly/features/home/home.dart';

class UpcomingEventsList extends ConsumerWidget {
  const UpcomingEventsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayEvents = ref.watch(calendarTodayEventsProvider);

    if (todayEvents.isEmpty) return _NoEvents();

    return SizedBox(
      height: 200,
      child: Padding(
        padding: Sizes.horizontalPadding,
        child: ListView.separated(
          itemCount: todayEvents.length,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final event = todayEvents[index];

            return ProviderScope(overrides: [
              calendarEventProvider.overrideWithValue(event),
            ], child: EventCard());
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: Sizes.medium),
        ),
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
