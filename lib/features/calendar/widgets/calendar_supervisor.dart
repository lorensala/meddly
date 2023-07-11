import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/widgets/widgets.dart';

class CalendarSupervisor extends HookConsumerWidget {
  const CalendarSupervisor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(supervisorControllerProvider);

    final selectedUsers = ref.watch(calendarSelectedUsersProvider);

    return AsyncValueWidget(
      value: users,
      error: const SizedBox.shrink(),
      loading: const _CalendarSupervisorShimmered(),
      builder: (users) {
        if (users.supervised.isEmpty) {
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
                isScrollControlled: true,
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
                                child: UserCircleAvatar(
                                  user: user,
                                  radius: Sizes.medium,
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
      },
    );
  }
}

class _CalendarSupervisorShimmered extends StatelessWidget {
  const _CalendarSupervisorShimmered();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: Sizes.medium * 2 + 4,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: CircleAvatar(
                      backgroundColor: context.colorScheme.surface,
                      radius: Sizes.medium,
                    ).customShimmer().customShimmer(),
                  ),
                  Positioned(
                    left: Sizes.large * 1,
                    child: CircleAvatar(
                      backgroundColor: context.colorScheme.surface,
                      radius: Sizes.medium,
                    ).customShimmer().customShimmer(),
                  ),
                  Positioned(
                    left: 2 * (Sizes.large),
                    child: CircleAvatar(
                      backgroundColor: context.colorScheme.surface,
                      radius: Sizes.medium,
                    ).customShimmer().customShimmer(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
