import 'package:measurement/measurement.dart';
import 'package:meddly/features/measurement/core/core.dart';
import 'package:meddly/features/measurement/provider/measurement_provider.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'measurement_controller.g.dart';

@riverpod
class MeasurementController extends _$MeasurementController {
  @override
  FutureOr<void> build() {}

  Future<void> createMeasurement(Measurement measurement) async {
    state = const AsyncLoading();

    final repository = ref.read(measurementRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (err, _) = await repository.addMeasurement(measurement);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      state = const AsyncData<void>(null);
    }
  }
}
