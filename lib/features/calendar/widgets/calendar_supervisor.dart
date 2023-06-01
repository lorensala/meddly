import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/supervisor/supervisor.dart';

class CalendarSupervisor extends HookConsumerWidget {
  const CalendarSupervisor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(calendarUsersProvider);
    final selected = ref.watch(selectedSupervisedProvider);

    if (users.isEmpty || users.length == 1) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.medium),
          child: ShimmeredContainer(
            height: Sizes.large,
            width: context.width * 0.5,
          ).customShimmer(),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(Sizes.medium),
      child: Center(
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              useRootNavigator: true,
              backgroundColor: context.colorScheme.background,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Sizes.large),
                ),
              ),
              builder: (_) {
                return ProviderScope(
                  parent: ProviderScope.containerOf(context),
                  child: const SelectSupervisedBottomSheet(),
                );
              },
            );
          },
          child: Text(
            selected == null || selected == users.first
                ? 'Toca aquí para ver el calendario de tus supervisados'
                : 'Calendario de ${selected.firstName} ${selected.lastName}',
            style: context.textTheme.bodyMedium!.copyWith(
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
