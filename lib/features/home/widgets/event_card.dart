import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:meddly/features/home/home.dart';

class EventCard extends ConsumerWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.watch(eventProvider);

    return ListTile(
      title: Text(event.title),
      leading: SizedBox(
        height: 48,
        width: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(Sizes.borderRadius),
          ),
        ),
      ),
      subtitle: Text(
        event.description,
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.onSecondary.withOpacity(0.7),
        ),
      ),
    );
  }
}
