import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/home/widgets/widgets.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/features/user/user.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class HomeBody extends ConsumerWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(calendarControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) {
          showSnackBar(context, err.toString());
        },
      );
    });

    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Sizes.mediumPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserGreetings(),
                  Spacer(),
                  NotificationsButton(),
                ],
              ),
            ),
            CalendarSupervisor(),
            CalendarDateAndDayIndicator(),
            CalendarDayList(),
            SizedBox(height: Sizes.medium),
            CalendarList(),
          ],
        ),
      ),
    );
  }
}

class CalendarSupervisor extends HookConsumerWidget {
  const CalendarSupervisor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(calendarUsersProvider);
    final selected = ref.watch(selectedSupervisedProvider);

    if (users.isEmpty || users.length == 1) {
      return const SizedBox.shrink();
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

class SelectSupervisedBottomSheet extends ConsumerWidget {
  const SelectSupervisedBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(calendarUsersProvider);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Sizes.medium),
          const BottomSheetDecoration(),
          const SizedBox(height: Sizes.medium),
          Text(
            context.l10n.selectASupervised,
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: Sizes.medium),
          ...users.map(
            (user) {
              return ProviderScope(
                overrides: [
                  supervisedProvider.overrideWithValue(user),
                ],
                child: const SupervisedSelectionItem(),
              );
            },
          ),
          const SizedBox(height: Sizes.medium),
        ],
      ),
    );
  }
}

class SupervisedSelectionItem extends ConsumerWidget {
  const SupervisedSelectionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supervised = ref.watch(supervisedProvider);
    final selected = ref.watch(selectedSupervisedProvider);
    final me = ref.watch(userProvider);

    return ListTile(
      onTap: () {
        ref.read(selectedSupervisedProvider.notifier).update(supervised);
        Navigator.of(context).pop();
      },
      selected: supervised == me || selected == supervised,
      trailing: supervised == me || selected == supervised
          ? Text('(YO)', style: context.textTheme.titleSmall)
          : null,
      leading: CircleAvatar(
        backgroundColor: context.colorScheme.primary,
        child: Text(
          '${supervised.firstName[0]}${supervised.lastName[0]}',
          style: context.textTheme.bodyMedium!
              .copyWith(color: context.colorScheme.onPrimary),
        ),
      ),
      title: Text('${supervised.firstName} ${supervised.lastName}'),
      subtitle: Text(supervised.email),
    );
  }
}
