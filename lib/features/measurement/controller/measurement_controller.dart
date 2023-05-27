import 'package:measurement/measurement.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'measurement_controller.g.dart';

@riverpod
class MeasurementController extends _$MeasurementController {
  @override
  FutureOr<List<Measurement>> build() async {
    final repository = ref.watch(measurementRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (err, measurements) = await repository.fetchAll();

    if (err != null) {
      throw Exception(err.describe(l10n));
    } else {
      return measurements;
    }
  }

  void refresh() {
    ref.invalidateSelf();
  }

  Future<void> createMeasurement(Measurement measurement) async {
    state = const AsyncLoading();

    final repository = ref.read(measurementRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (err, _) = await repository.addMeasurement(measurement);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref.watch(goRouterProvider).pop();
      refresh();
    }
  }

  Future<void> deleteMeasurement(int id) async {
    state = const AsyncLoading();

    final repository = ref.read(measurementRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (err, _) = await repository.deleteMeasurement(id);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref.watch(goRouterProvider).pop();
      refresh();
    }
  }
}
