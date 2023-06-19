import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:medicine/medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'archived_medicine_controller.g.dart';

@riverpod
class ArchivedMedicineController extends _$ArchivedMedicineController {
  @override
  Future<List<Medicine>> build() async {
    final repository = ref.read(medicineRepositoryProvider);

    final (err, medicines) = await repository.getArchivedMedicines();

    final l10n = ref.read(l10nProvider) as AppLocalizations;

    if (err != null) {
      throw Exception(err.describe(l10n));
    } else {
      return medicines;
    }
  }

  Future<void> archiveMedicine(Medicine medicine) async {
    final repository = ref.read(medicineRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (err, _) = await repository.archiveMedicine(medicine);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
      return;
    }

    final (deleteErr, _) = await repository.deleteMedicine(medicine);

    if (deleteErr != null) {
      state = AsyncError(deleteErr.describe(l10n), StackTrace.current);
    } else {
      ref.invalidateSelf();
    }
  }

  Future<void> unarchiveMedicine(Medicine medicine) async {
    final repository = ref.read(medicineRepositoryProvider);
    final l10n = ref.read(l10nProvider) as AppLocalizations;

    final (deleteErr, _) = await repository.addMedicine(medicine);

    if (deleteErr != null) {
      state = AsyncError(deleteErr.describe(l10n), StackTrace.current);
    }

    final (err, _) = await repository.deleteArchivedMedicine(medicine);

    if (err != null) {
      state = AsyncError(err.describe(l10n), StackTrace.current);
    } else {
      ref.invalidateSelf();
    }
  }
}
