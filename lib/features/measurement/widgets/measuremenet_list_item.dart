import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/router.dart';
import 'package:meddly/widgets/widgets.dart';

class MeasurementListItem extends ConsumerWidget {
  const MeasurementListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final measurement = ref.watch(measurementProvider);

    return Dismissible(
      key: Key(measurement.id.toString()),
      onDismissed: (_) {
        ref
            .read(measurementControllerProvider.notifier)
            .deleteMeasurement(measurement.id);
      },
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (_) => ProviderScope(
            parent: ProviderScope.containerOf(context),
            child: AlertDialog(
              title: Text(context.l10n.confirm),
              content: Text(
                context.l10n.deleteMeasurementConfirmation,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    ref.read(goRouterProvider).pop(false);
                  },
                  child: Text(context.l10n.cancel),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(goRouterProvider).pop(true);
                  },
                  child: Text(context.l10n.delete),
                ),
              ],
            ),
          ),
        );
      },
      background: const DismissibleSecondaryBackground(),
      direction: DismissDirection.endToStart,
      child: ListTile(
        leading: SizedBox(
          height: Sizes.large,
          width: Sizes.large,
          child: SvgPicture.asset(Vectors.measurement),
        ),
        minLeadingWidth: 0,
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(measurement.type.localizedString(context.l10n)),
        subtitle: Text(
          measurement.value.toString(),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSecondary.withOpacity(0.5),
          ),
        ),
        trailing: Text(
          measurement.date.localizedString(context),
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSecondary.withOpacity(0.5),
          ),
        ),
        onTap: () => ref.read(goRouterProvider).go(
              '${BrowsePage.routeName}/${MeasurementPage.routeName}/${MeasurementFormPage.routeName}/${measurement.id}',
            ),
      ),
    );
  }
}
