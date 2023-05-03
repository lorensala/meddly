import 'package:flutter/material.dart' show TimeOfDay;
import 'package:meddly/features/medicine/controller/medicine_form_controller.dart';
import 'package:meddly/l10n/l10n.dart';
import 'package:meddly/provider/provider.dart';
import 'package:medicine/medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'medicine_provider.g.dart';

@riverpod
MedicineCache medicineCache(MedicineCacheRef ref) {
  return MedicineCache(ref.read(medicineBoxProvider));
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
Name medicineName(MedicineNameRef ref) {
  return ref.watch(medicineFormControllerProvider).name;
}

@riverpod
String? medicineNameErrorText(MedicineNameErrorTextRef ref) {
  final name = ref.watch(medicineNameProvider);
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return !name.pure && name.invalid
      ? name.error?.when(
          invalid: () => l10n.invalidMedicineName,
          tooLong: () => l10n.medicineNameTooLong,
          empty: () => l10n.medicineNameEmpty,
        )
      : null;
}

@riverpod
bool isMedicineNameValid(IsMedicineNameValidRef ref) {
  final name = ref.watch(medicineNameProvider);
  return name.valid && name.value.isNotEmpty;
}

@riverpod
MedicinePresentation medicinePresentation(MedicinePresentationRef ref) {
  return ref.watch(medicineFormControllerProvider).presentation;
}

@riverpod
NotNegativeIntNumber medicineDosis(MedicineDosisRef ref) {
  return ref.watch(medicineFormControllerProvider).dosis;
}

@riverpod
String? medicineDosisErrorText(MedicineDosisErrorTextRef ref) {
  final dosis = ref.watch(medicineDosisProvider);
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return dosis.invalid ? l10n.invalidDosis : null;
}

@riverpod
bool isMedicineDosisValid(IsMedicineDosisValidRef ref) {
  final dosis = ref.watch(medicineDosisProvider);
  return dosis.valid && dosis.value.isNotEmpty;
}

@riverpod
MedicineDosisUnit medicineDosisUnit(MedicineDosisUnitRef ref) {
  return ref.watch(medicineFormControllerProvider).dosisUnit;
}

@riverpod
NotNegativeIntNumber medicineStock(MedicineStockRef ref) {
  return ref.watch(medicineFormControllerProvider).stock;
}

@riverpod
MedicineFrecuency medicineFrecuency(MedicineFrecuencyRef ref) {
  return ref.watch(medicineFormControllerProvider).frecuency;
}

@riverpod
List<MedicineDay> medicineDays(MedicineDaysRef ref) {
  return ref.watch(medicineFormControllerProvider).days;
}

@riverpod
List<TimeOfDay> medicineHours(MedicineHoursRef ref) {
  return ref.watch(medicineFormControllerProvider).hours;
}

@riverpod
int medicineFrecuencyValue(MedicineFrecuencyValueRef ref) {
  return ref.watch(medicineFormControllerProvider).frecuencyValue;
}

@riverpod
NotNegativeIntNumber medicineStockWarning(MedicineStockWarningRef ref) {
  return ref.watch(medicineFormControllerProvider).stockWarning;
}

@riverpod
String? medicineStockWarningErrorText(MedicineStockWarningErrorTextRef ref) {
  final stockWarning = ref.watch(medicineStockWarningProvider);
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return stockWarning.invalid ? l10n.invalidStockWarning : null;
}

@riverpod
String? medicineStockErrorText(MedicineStockErrorTextRef ref) {
  final stock = ref.watch(medicineStockProvider);
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return stock.invalid ? l10n.invalidCurrentStock : null;
}

@riverpod
Instructions medicineInstructions(MedicineInstructionsRef ref) {
  return ref.watch(medicineFormControllerProvider).instructions;
}

@riverpod
String? medicineInstructionErrorText(MedicineInstructionErrorTextRef ref) {
  final instructions = ref.watch(medicineInstructionsProvider);
  final l10n = ref.watch(l10nProvider) as AppLocalizations;

  return instructions.invalid
      ? instructions.error?.when(
          invalid: () => l10n.invalidInstructions,
          tooLong: () => l10n.instructionsTooLong,
        )
      : null;
}

@riverpod
bool isMedicineReviewValid(IsMedicineReviewValidRef ref) {
  final stock = ref.watch(medicineStockProvider);
  final stockWarning = ref.watch(medicineStockWarningProvider);
  final instructions = ref.watch(medicineInstructionsProvider);

  return stock.valid &&
      stockWarning.valid &&
      instructions.valid &&
      instructions.valid;
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
