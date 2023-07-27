// ignore_for_file: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:measurement/measurement.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/measurement/measurement.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/provider/go_router_provider.dart';
import 'package:meddly/widgets/success_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'measurement_controller.g.dart';

@riverpod
class MeasurementController extends _$MeasurementController {
  @override
  FutureOr<List<Measurement>> build() async {
    final cancelToken = CancelToken();

    final repository = ref.watch(measurementRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    ref.onDispose(cancelToken.cancel);

    final (err, measurements) =
        await repository.fetchAll(cancelToken: cancelToken);

    if (err != null) {
      throw Exception(err.describe(l10n));
    } else {
      return measurements;
    }
  }

  void refresh() {
    state = const AsyncLoading();
    ref
      ..invalidate(calendarControllerProvider)
      ..invalidateSelf();
  }

  void reload() {
    ref
      ..invalidate(calendarControllerProvider)
      ..invalidateSelf();
  }

  Future<void> createMeasurement(Measurement measurement) async {
    final cancelToken = CancelToken();

    state = const AsyncLoading();

    final repository = ref.read(measurementRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    ref.onDispose(cancelToken.cancel);

    final (err, _) = await repository.createMeasurement(
      measurement,
      cancelToken: cancelToken,
    );

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref.read(goRouterProvider).go(SuccessPage.routeName);
      reload();
    }
  }

  Future<void> updateMeasurement(Measurement measurement) async {
    final cancelToken = CancelToken();

    state = const AsyncLoading();

    final repository = ref.read(measurementRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    ref.onDispose(cancelToken.cancel);

    final (err, _) = await repository.updateMeasurement(
      measurement,
      cancelToken: cancelToken,
    );

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      reload();
      ref.watch(goRouterProvider).pop();
    }
  }

  Future<void> deleteMeasurement(int id) async {
    final cancelToken = CancelToken();

    final repository = ref.read(measurementRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    ref.onDispose(cancelToken.cancel);

    final (err, _) =
        await repository.deleteMeasurement(id, cancelToken: cancelToken);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      reload();
    }
  }

  Measurement? getMeasurement(int id) {
    return state.whenOrNull(
      data: (measurements) => measurements.firstWhereOrNull((m) => m.id == id),
    );
  }
}
