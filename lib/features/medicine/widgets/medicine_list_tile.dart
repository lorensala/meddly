import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/widgets/widgets.dart';

class MedicineListTile extends ConsumerWidget {
  const MedicineListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medicine = ref.watch(medicineProvider);
    return Dismissible(
      key: Key(medicine.id.toString()),
      onDismissed: (_) {
        // ref
        //     .read(medicineControllerProvider.notifier)
        //     .deleteAppointment(medicine.id!);
      },
      confirmDismiss: (_) {
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
      },
      secondaryBackground: const DismissibleSecondaryBackground(),
      background: const DismissibleBackground(),
      child: ListTile(
        title: Text(medicine.name),
        leading: SizedBox(
          height: Sizes.large,
          width: Sizes.large,
          child: SvgPicture.asset(Vectors.medicine),
        ),
        trailing: SizedBox(
          child: Text('${medicine.dosis} ${medicine.dosisUnit.value}'),
        ),
        titleAlignment: ListTileTitleAlignment.center,
        minLeadingWidth: 0,
        subtitle: Text(
          '${medicine.stock} unidades restantes',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSecondary.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
