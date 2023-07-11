import 'package:dio/dio.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/router.dart';
import 'package:meddly/widgets/widgets.dart';
import 'package:medicine/medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medicine_controller.g.dart';

@riverpod
class MedicineController extends _$MedicineController {
  @override
  FutureOr<List<Medicine>> build() async {
    final cancelToken = CancelToken();
    final repository = ref.read(medicineRepositoryProvider);

    ref.onDispose(cancelToken.cancel);

    final (err, medicines) =
        await repository.fetchAll(cancelToken: cancelToken);

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      throw Exception(err.describe(l10n));
    }

    return medicines;
  }

  Future<void> addMedicine(Medicine medicine) async {
    final cancelToken = CancelToken();
    state = const AsyncLoading();

    ref.onDispose(cancelToken.cancel);

    final repository = ref.watch(medicineRepositoryProvider);

    final (err, _) =
        await repository.addMedicine(medicine, cancelToken: cancelToken);

    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref
        ..invalidate(calendarControllerProvider)
        ..invalidateSelf();

      ref.read(goRouterProvider).go(SuccessPage.routeName);
    }
  }

  Future<void> deleteMedicine(Medicine medicine) async {
    final cancelToken = CancelToken();
    final repository = ref.watch(medicineRepositoryProvider);

    ref.onDispose(cancelToken.cancel);

    final (err, _) =
        await repository.deleteMedicine(medicine, cancelToken: cancelToken);

    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref
        ..invalidate(calendarControllerProvider)
        ..invalidateSelf();
    }
  }

  void refresh() {
    state = const AsyncLoading();
    ref
      ..invalidate(calendarControllerProvider)
      ..invalidateSelf();
  }
}
