import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineListTile extends ConsumerWidget {
  const MedicineListTile({this.isArchived = false, super.key});

  final bool isArchived;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicine = ref.watch(medicineProvider);
    return Dismissible(
      key: Key(medicine.id.toString()),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          ref
              .read(medicineControllerProvider.notifier)
              .deleteMedicine(medicine);
        } else if (direction == DismissDirection.startToEnd) {
          if (isArchived) {
            ref
                .read(archivedMedicineControllerProvider.notifier)
                .unarchiveMedicine(medicine);
          } else {
            ref
                .read(archivedMedicineControllerProvider.notifier)
                .archiveMedicine(medicine);
          }
        }
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(context.l10n.confirm),
              content: Text(
                context.l10n.deleteMedicineConfirmation,
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
        } else if (direction == DismissDirection.startToEnd) {
          return showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(context.l10n.confirm),
              content: Text(
                context.l10n.archiveMedicineConfirmation,
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
                  child: Text(context.l10n.archive),
                ),
              ],
            ),
          );
        }
        return Future.value(false);
      },
      secondaryBackground: const DismissibleDeleteBackground(),
      background: isArchived
          ? const DismissibleBackgroundVariant()
          : const DismissibleBackground(),
      child: ListTile(
        title: Text(medicine.name),
        leading: SizedBox(
          height: Sizes.large,
          width: Sizes.large,
          child: SvgPicture.asset(Vectors.medicine),
        ),
        trailing: SizedBox(
          child:
              Text('${medicine.dosis.truncate()} ${medicine.dosisUnit.value}'),
        ),
        titleAlignment: ListTileTitleAlignment.center,
        minLeadingWidth: 0,
        subtitle: Text(
          '${medicine.stock} ${context.l10n.unitsLeft}',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSecondary.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
