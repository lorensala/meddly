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
    final selectedUsers = ref.watch(selectedSupervisedProvider);

    if (users.isEmpty) {
      return const SizedBox.shrink();
    }

    return Builder(
      builder: (context) {
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
                selectedUsers.length == users.length
                    ? 'Calendario de todos los pacientes'
                    : 'Filtrado',
                style: context.textTheme.bodyMedium!.copyWith(
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
