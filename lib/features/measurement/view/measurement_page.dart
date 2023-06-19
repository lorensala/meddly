import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:measurement/measurement.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/widgets.dart';

class MeasurementPage extends ConsumerWidget {
  const MeasurementPage({super.key});

  static String routeName = 'measurement';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.measurements),
        actions: const [
          MeasurementFilter(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(goRouterProvider).go(
              '${BrowsePage.routeName}/${MeasurementPage.routeName}/${MeasurementFormPage.routeName}/""',
            ),
        tooltip: context.l10n.newMeasurement,
        child: const Icon(Icons.add),
      ),
      body: const MeasurementView(),
    );
  }
}

class MeasurementView extends ConsumerWidget {
  const MeasurementView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(measurementControllerProvider, (_, state) {
      state.whenOrNull(
        error: (err, _) {
          showSnackBar(context, err.toString());
        },
      );
    });

    return const MeasurementList();
  }
}

class MeasurementFilter extends StatelessWidget {
  const MeasurementFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.medium),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
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
                  final selectedFilters = ref.watch(measurementTypesProvider);
                  final notifier = ref.read(measurementTypesProvider.notifier);

                  return FilterModal<MeasurementType>(
                    items: MeasurementType.values,
                    labelBuilder: (item) => item.localizedString(context.l10n),
                    selectedItems: selectedFilters,
                    onAllSelected: () =>
                        ref.invalidate(measurementTypesProvider),
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
                final selectedFilters = ref.watch(measurementTypesProvider);
                return Visibility(
                  visible:
                      selectedFilters.length != MeasurementType.values.length,
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
