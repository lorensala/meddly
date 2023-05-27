import 'package:meddly/features/browse/browse.dart';
import 'package:meddly/features/calendar/calendar.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/router/router.dart';
import 'package:medicine/medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medicine_controller.g.dart';

@riverpod
class MedicineController extends _$MedicineController {
  @override
  FutureOr<void> build() {}

  Future<void> addMedicine(Medicine medicine) async {
    state = const AsyncLoading();

    final repository = ref.watch(medicineRepositoryProvider);

    final (err, _) = await repository.addMedicine(medicine);

    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
      return;
    }

    ref.invalidate(calendarControllerProvider);

    state = const AsyncData(null);

    ref
        .read(goRouterProvider)
        .go('${BrowsePage.routeName}/${MedicinePage.routeName}');
  }
}
