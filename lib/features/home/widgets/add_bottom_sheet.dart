import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/features/supervisor/supervisor.dart';
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
              Navigator.of(context).pop();
              ref.read(goRouterProvider).push(
                    '/${MeasurementFormPage.routeName}/""',
                  );
            },
            description: context.l10n.measurementsDescription,
          ),
          _AddBottomSheetItem(
            icon: Vectors.appointment,
            label: context.l10n.newAppointment,
            onTap: () {
              Navigator.of(context).pop();
              ref.read(goRouterProvider).push(
                    '/${AppointmentFormPage.routeName}/""',
                  );
            },
            description: context.l10n.appointmentDescription,
          ),
          _AddBottomSheetItem(
            icon: Vectors.medicine,
            label: context.l10n.newMedicine,
            onTap: () {
              Navigator.of(context).pop();
              ref.read(goRouterProvider).push(
                    '/${MedicineNamePage.routeName}',
                  );
            },
            description: context.l10n.medicinesDescriptions,
          ),
          _AddBottomSheetItem(
            icon: Vectors.linkedAccount,
            label: context.l10n.addSupervisor,
            onTap: () async {
              Navigator.of(context).pop();
              await showModalBottomSheet<void>(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                backgroundColor: context.colorScheme.background,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Sizes.large),
                  ),
                ),
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: const InvitationCodeBottomSheet(),
                  );
                },
              );
            },
            description: context.l10n.addSupervisorDescription,
          ),
          const SizedBox(height: Sizes.medium),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              context.l10n.goBack,
              style: context.textTheme.bodyMedium!.underlined(),
            ),
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
      onTap: onTap,
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
