import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/notifications/notifications.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:notifications/notifications.dart';

class NotificationsFilter extends StatelessWidget {
  const NotificationsFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.medium),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(Sizes.medium),
              ),
            ),
            useRootNavigator: true,
            builder: (context) => ProviderScope(
              parent: ProviderScope.containerOf(context),
              child: Consumer(
                builder: (context, ref, child) {
                  final selectedFilters =
                      ref.watch(notificationSelectedTypesProvider);
                  final notifier =
                      ref.read(notificationSelectedTypesProvider.notifier);

                  return FilterModal<NotificationType>(
                    items: NotificationType.values,
                    labelBuilder: (item) => item.localizedString(context.l10n),
                    selectedItems: selectedFilters,
                    onAllSelected: () =>
                        ref.invalidate(notificationSelectedTypesProvider),
                    onSelected: notifier.select,
                    onDeselected: notifier.unselect,
                    onCleanSelection: notifier.clear,
                  );
                },
              ),
            ),
          );
        },
        child: Stack(
          children: [
            SvgPicture.asset(Vectors.filterLines),
            Consumer(
              builder: (context, ref, child) {
                final selectedFilters =
                    ref.watch(notificationSelectedTypesProvider);
                return Visibility(
                  visible:
                      selectedFilters.length != NotificationType.values.length,
                  child: const Positioned(
                    right: 0,
                    top: 0,
                    child: Badge(
                      smallSize: Sizes.small,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
