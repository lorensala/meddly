import 'package:calendar/calendar.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'consumption_controller.g.dart';

@Riverpod(dependencies: [])
class ConsumptionController extends _$ConsumptionController {
  @override
  FutureOr<void> build() {}

  Future<void> addConsumption(Consumption consumption) async {
    state = const AsyncLoading();
    final repository = ref.read(calendarRepositoryProvider);
    final (err, _) = await repository.addConsumption(consumption);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref.invalidate(calendarControllerProvider);
      state = const AsyncData(null);
    }
  }

  Future<void> deleteConsumption(Consumption consumption) async {
    state = const AsyncLoading();
    final repository = ref.read(calendarRepositoryProvider);
    final (err, _) = await repository.removeConsumption(consumption);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref.invalidate(calendarControllerProvider);
      state = const AsyncData(null);
    }
  }
}
