import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/l10n/l10n.dart';

class AppointmentListItem extends ConsumerWidget {
  const AppointmentListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointment = ref.watch(appointmentProvider);
    return Dismissible(
      key: Key(appointment.id.toString()),
      onDismissed: (_) {
        ref
            .read(appointmentControllerProvider.notifier)
            .deleteAppointment(appointment.id!);
      },
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(context.l10n.confirm),
            content: Text(
              context.l10n.deleteAppointmentConfirmation,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(context.l10n.cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(context.l10n.delete),
              ),
            ],
          ),
        );
      },
      background: ColoredBox(
        color: context.colorScheme.error,
        child: const Padding(
          padding: EdgeInsets.only(right: Sizes.medium),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      child: ListTile(
        title: Text(appointment.name),
        subtitle: Text(appointment.speciality!.localized(context.l10n)),
        onTap: () => GoRouter.of(context).go(
          '${BrowsePage.routeName}/${AppointmentPage.routeName}/${AppointmentFormPage.routeName}/${appointment.id}',
        ),
      ),
    );
  }
}
