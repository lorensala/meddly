import 'package:appointment/appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class AppointmentFilter extends StatelessWidget {
  const AppointmentFilter({super.key});

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
                      ref.watch(appointmentSpecialitiesProvider);
                  final notifier =
                      ref.read(appointmentSpecialitiesProvider.notifier);

                  return FilterModal<AppointmentSpeciality>(
                    items: AppointmentSpeciality.values,
                    labelBuilder: (item) => item.localizedString(context.l10n),
                    selectedItems: selectedFilters,
                    onAllSelected: () =>
                        ref.invalidate(appointmentSpecialitiesProvider),
                    onSelected: notifier.select,
                    onDeselected: notifier.deselect,
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
                    ref.watch(appointmentSpecialitiesProvider);
                return Visibility(
                  visible: selectedFilters.length !=
                      AppointmentSpeciality.values.length,
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
