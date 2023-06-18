import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/router.dart';

class MeasurementListItem extends ConsumerWidget {
  const MeasurementListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final measurement = ref.watch(measurementProvider);

    return ListTile(
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
    );
  }
}
