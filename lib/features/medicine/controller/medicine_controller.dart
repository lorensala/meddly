import 'package:calendar/calendar.dart';
import 'package:meddly/features/calendar/provider/provider.dart';
import 'package:meddly/features/medicine/core/extension.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/provider/l10n_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medicine_controller.g.dart';

@riverpod
class MedicineController extends _$MedicineController {
  @override
  FutureOr<void> build() {}

  Future<void> addMedicine(Medicine medicine) async {
    state = AsyncLoading();

    final repository = ref.watch(medicineRepositoryProvider);

    final res = await repository.addMedicine(medicine);

    final l10n = ref.watch(l10nProvider);

    state = res.fold(
      (failure) => AsyncError(failure.message(l10n), StackTrace.current),
      (_) {
        repository.fetchAll();
        ref.watch(calendarRepositoryProvider).fetchCalendar();
        return AsyncData(null);
      },
    );
  }
}
