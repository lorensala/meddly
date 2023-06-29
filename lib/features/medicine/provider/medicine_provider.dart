import 'package:hive_flutter/hive_flutter.dart';
import 'package:meddly/features/medicine/medicine.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/provider/provider.dart';
import 'package:medicine/medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medicine_provider.g.dart';

@riverpod
Box<String> medicineBox(MedicineBoxRef ref) {
  throw UnimplementedError();
}

@riverpod
MedicineCache medicineCache(MedicineCacheRef ref) {
  final box = ref.read(medicineBoxProvider);
  return MedicineCache(box);
}

@riverpod
MedicineApi medicineApi(MedicineApiRef ref) {
  return MedicineApi(ref.read(dioProvider));
}

@riverpod
MedicineRepository medicineRepository(MedicineRepositoryRef ref) {
  return MedicineRepository(
    api: ref.read(medicineApiProvider),
    cache: ref.read(medicineCacheProvider),
  );
}

@riverpod
String? medicineNameErrorText(MedicineNameErrorTextRef ref) {
  final name = ref.watch(medicineFormControllerProvider.select((s) => s.name));
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !name.isPure && name.isPure
      ? name.error?.when(
          invalid: () => l10n.invalidMedicineName,
          tooLong: () => l10n.medicineNameTooLong,
          empty: () => l10n.medicineNameEmpty,
        )
      : null;
}

@riverpod
bool isMedicineNameValid(IsMedicineNameValidRef ref) {
  final name = ref.watch(medicineFormControllerProvider.select((s) => s.name));
  return name.isValid && name.value.isNotEmpty;
}

@riverpod
String? medicineDosisErrorText(MedicineDosisErrorTextRef ref) {
  final dosis =
      ref.watch(medicineFormControllerProvider.select((s) => s.dosis));
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return dosis.isNotValid ? l10n.invalidDosis : null;
}

@riverpod
bool isMedicineDosisValid(IsMedicineDosisValidRef ref) {
  final dosis =
      ref.watch(medicineFormControllerProvider.select((s) => s.dosis));
  return dosis.isValid && dosis.value.isNotEmpty;
}

@riverpod
String? medicineStockWarningErrorText(MedicineStockWarningErrorTextRef ref) {
  final stockWarning =
      ref.watch(medicineFormControllerProvider.select((s) => s.stockWarning));
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return stockWarning.isNotValid ? l10n.invalidStockWarning : null;
}

@riverpod
String? medicineStockErrorText(MedicineStockErrorTextRef ref) {
  final stock =
      ref.watch(medicineFormControllerProvider.select((s) => s.stock));
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return stock.isNotValid ? l10n.invalidCurrentStock : null;
}

@riverpod
String? medicineInstructionErrorText(MedicineInstructionErrorTextRef ref) {
  final instructions =
      ref.watch(medicineFormControllerProvider.select((s) => s.instructions));
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return instructions.isNotValid
      ? instructions.error?.when(
          invalid: () => l10n.invalidInstructions,
          tooLong: () => l10n.instructionsTooLong,
        )
      : null;
}

@riverpod
bool isMedicineReviewValid(IsMedicineReviewValidRef ref) {
  final stock =
      ref.watch(medicineFormControllerProvider.select((s) => s.stock));
  final stockWarning =
      ref.watch(medicineFormControllerProvider.select((s) => s.stockWarning));
  final instructions =
      ref.watch(medicineFormControllerProvider.select((s) => s.instructions));

  return stock.isValid &&
      stockWarning.isValid &&
      instructions.isValid &&
      instructions.isValid;
}

@riverpod
bool isMedicineStartDateAndHourValid(IsMedicineStartDateAndHourValidRef ref) {
  final state = ref.watch(medicineFormControllerProvider);

  if (state.frecuency == MedicineFrecuency.asNeeded) return true;

  final startDate = state.startDate;
  final hours = state.hours;

  return startDate != null && hours.isNotEmpty;
}

@riverpod
bool isMedicineFrecuencyValid(IsMedicineFrecuencyValidRef ref) {
  final state = ref.watch(medicineFormControllerProvider);
  if (state.frecuency == MedicineFrecuency.asNeeded) return true;
  return state.isFrecuencyValid;
}

@Riverpod(dependencies: [])
Medicine medicine(MedicineRef ref) {
  throw UnimplementedError();
}

@riverpod
List<Medicine> filteredMedicines(FilteredMedicinesRef ref) {
  final medicines = ref.watch(medicineControllerProvider);
  final filtersSelected = ref.watch(medicinePresentationsProvider);

  return medicines.when(
    data: (medicines) {
      return medicines.where((medicine) {
        return filtersSelected.contains(medicine.presentation);
      }).toList();
    },
    loading: () => [],
    error: (e, s) => [],
  );
}

@riverpod
List<Medicine> filteredArchivedMedicines(FilteredArchivedMedicinesRef ref) {
  final medicines = ref.watch(archivedMedicineControllerProvider);
  final filtersSelected = ref.watch(medicinePresentationsProvider);

  return medicines.when(
    data: (medicines) {
      return medicines.where((medicine) {
        return filtersSelected.contains(medicine.presentation);
      }).toList();
    },
    loading: () => [],
    error: (e, s) => [],
  );
}

@riverpod
class MedicinePresentations extends _$MedicinePresentations {
  @override
  List<MedicinePresentation> build() {
    return MedicinePresentation.values;
  }

  void select(MedicinePresentation presentation) {
    state = [...state, presentation];
  }

  void deselect(MedicinePresentation presentation) {
    state = state.where((e) => e != presentation).toList();
  }

  void clear() {
    state = [];
  }
}
