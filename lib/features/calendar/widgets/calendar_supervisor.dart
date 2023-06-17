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
    final selectedUsers = ref.watch(calendarSelectedUsersProvider);

    if (calendarUsers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
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
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: Sizes.medium * 2 + 4,
                child: Stack(
                  children: [
                    for (final user in selectedUsers)
                      Positioned(
                        left: selectedUsers.indexOf(user) * (Sizes.large),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: boxShadow(context),
                          ),
                          child: CircleAvatar(
                            radius: Sizes.medium + 2,
                            backgroundColor: context.colorScheme.background,
                            child: CircleAvatar(
                              radius: Sizes.medium,
                              backgroundColor: context.colorScheme.primary,
                              child: Text(
                                user.firstName[0] + user.lastName[0],
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      left: selectedUsers.length * (Sizes.large),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: boxShadow(context),
                        ),
                        child: CircleAvatar(
                          radius: Sizes.medium + 2,
                          backgroundColor: context.colorScheme.background,
                          child: CircleAvatar(
                            radius: Sizes.medium,
                            backgroundColor: context.colorScheme.secondary,
                            child: Icon(
                              Icons.add,
                              color: context.colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// get color from user initials
// Color getColorFromInitials(String initials) {
//   final colors = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.orange,
//     Colors.purple,
//     Colors.pink,
//     Colors.teal,
//     Colors.cyan,
//     Colors.indigo,
//     Colors.amber,
//     Colors.brown,
//     Colors.grey,
//   ];

//   final index = initials.codeUnitAt(0) % colors.length;
//   return colors[index];
// }
