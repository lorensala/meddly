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
  FutureOr<List<Medicine>> build() async {
    final repository = ref.read(medicineRepositoryProvider);

    final (err, medicines) = await repository.fetchAll();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      throw Exception(err.describe(l10n));
    }

    return medicines;
  }

  Future<void> addMedicine(Medicine medicine) async {
    state = const AsyncLoading();

    final repository = ref.watch(medicineRepositoryProvider);

    final (err, _) = await repository.addMedicine(medicine);

    final l10n = ref.watch(l10nProvider) as AppLocalizations;

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref
        ..invalidate(calendarControllerProvider)
        ..invalidateSelf();

      ref
          .read(goRouterProvider)
          .go('${BrowsePage.routeName}/${MedicinePage.routeName}');
    }
  }
}
