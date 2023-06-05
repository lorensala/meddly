import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/router/router.dart';

class MeasurementListItem extends ConsumerWidget {
  const MeasurementListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final measurement = ref.watch(measurementProvider);

    return ListTile(
      title: Text(measurement.value.toString()),
      subtitle: Text(measurement.type.name),
      onTap: () => ref.read(goRouterProvider).go(
            '${BrowsePage.routeName}/${MeasurementPage.routeName}/${MeasurementDetailPage.routeName}/${measurement.id}',
          ),
    );
  }
}
