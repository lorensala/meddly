import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

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
          const SizedBox(height: Sizes.extraLarge),
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
          const SizedBox(height: Sizes.large),
          const _ApplyChangesButton(),
          const SizedBox(height: Sizes.medium),
          TextButton(
            onPressed: () {
              ref.read(calendarSelectedUsersProvider.notifier).update([]);
            },
            child: Text(
              context.l10n.cleanSelection,
              style: context.textTheme.bodyMedium!.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: Sizes.large),
        ],
      ),
    );
  }
}

class _ApplyChangesButton extends ConsumerWidget {
  const _ApplyChangesButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUsers = ref.watch(calendarSelectedUsersProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.medium),
      child: Button(
        isValid: selectedUsers.isNotEmpty,
        onPressed: () {
          ref
              .read(calendarSelectedUsersProvider.notifier)
              .update(selectedUsers);

          ref.invalidate(calendarControllerProvider);

          Navigator.of(context).pop();
        },
        label: context.l10n.apply,
      ),
    );
  }
}
