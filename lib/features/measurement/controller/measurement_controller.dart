import 'package:measurement/measurement.dart';
import 'package:meddly/features/measurement/measurement.dart';
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

    final res = await repository.addMeasurement(measurement);

    state = res.fold(
      (failure) => AsyncError(failure.message(l10n), StackTrace.current),
      AsyncData.new,
    );
  }
}
