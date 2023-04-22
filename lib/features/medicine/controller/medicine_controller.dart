import 'package:dartz/dartz.dart';
import 'package:meddly/core/core.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:medicine/medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medicine_controller.g.dart';

@riverpod
class MedicineController extends _$MedicineController {
  @override
  Future<Either<MedicineFailure, List<Medicine>>> build() {
    final repository = ref.watch(medicineRepositoryProvider);
    return repository.fetchAll();
  }

  Future<void> addMedicine(Medicine medicine) async {
    state = const AsyncLoading();

    final repository = ref.watch(medicineRepositoryProvider);

    final res = await repository.addMedicine(medicine);

    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    if (res.isLeft()) {
      state = AsyncError(res.asLeft().message(l10n), StackTrace.current);
      return;
    }

    ref.invalidate(calendarControllerProvider);
  }

  void retry() {
    return ref.invalidateSelf();
  }
}
