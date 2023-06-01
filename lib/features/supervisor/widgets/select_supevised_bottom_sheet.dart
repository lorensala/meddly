import 'package:flutter/material.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/home/home.dart';
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
