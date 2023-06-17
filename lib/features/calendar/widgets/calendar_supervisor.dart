import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/supervisor/supervisor.dart';

class CalendarSupervisor extends HookConsumerWidget {
  const CalendarSupervisor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarUsers = ref.watch(calendarUsersProvider);
    final selectedUser = ref.watch(calendarSelectedUsersProvider);

    if (calendarUsers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Builder(
      builder: (context) {
        return ColoredBox(
          color: context.colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.medium),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isDismissible: false,
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
                  calendarUsers.length == selectedUser.length
                      ? 'Todos'
                      : 'Supervisados',
                  style: context.textTheme.bodyMedium!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
