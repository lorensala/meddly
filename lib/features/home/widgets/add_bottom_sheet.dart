import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/provider.dart';
import 'package:meddly/widgets/widgets.dart';

class AddBottomSheet extends ConsumerWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Sizes.medium),
          const BottomSheetDecoration(),
          const SizedBox(height: Sizes.extraLarge),
          _AddBottomSheetItem(
            icon: Vectors.measurement,
            label: context.l10n.newMeasurement,
            onTap: () {
              ref.read(goRouterProvider).go(
                    '${BrowsePage.routeName}/${MeasurementPage.routeName}/${MeasurementFormPage.routeName}',
                  );
            },
            description: context.l10n.measurementsDescription,
          ),
          _AddBottomSheetItem(
            icon: Vectors.appointment,
            label: context.l10n.newAppointment,
            onTap: () {
              ref.read(goRouterProvider).go(
                    '${BrowsePage.routeName}/${AppointmentPage.routeName}/${AppointmentFormPage.routeName}/""',
                  );
            },
            description: context.l10n.appointmentDescription,
          ),
          _AddBottomSheetItem(
            icon: Vectors.medicine,
            label: context.l10n.newMedicine,
            onTap: () {
              ref.read(goRouterProvider).go(
                    '${BrowsePage.routeName}/${MedicinePage.routeName}/${MedicineNamePage.routeName}',
                  );
            },
            description: context.l10n.medicinesDescriptions,
          ),
          const SizedBox(height: Sizes.medium),
        ],
      ),
    );
  }
}

class _AddBottomSheetItem extends StatelessWidget {
  const _AddBottomSheetItem({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.description,
  });

  final String icon;
  final String label;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
        GoRouter.of(context).pop();
      },
      minLeadingWidth: 0,
      titleAlignment: ListTileTitleAlignment.center,
      leading: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          context.colorScheme.onSecondary,
          BlendMode.srcIn,
        ),
      ),
      title: Text(
        label,
        style: context.textTheme.titleMedium,
      ),
      subtitle: Text(
        description,
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.onBackground.withOpacity(0.5),
        ),
      ),
    );
  }
}
