import 'package:flutter/material.dart' show TimeOfDay;
import 'package:meddly/features/medicine/controller/medicine_controller.dart';
import 'package:meddly/features/medicine/state/state.dart';
import 'package:medicine/medicine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:validators/validators.dart';

part 'medicine_form_controller.g.dart';

@riverpod
class MedicineFormController extends _$MedicineFormController {
  @override
  MedicineFormState build() {
    return MedicineFormState();
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);

    state = state.copyWith(name: name);
  }

  void presentationChanged(MedicinePresentation value) {
    state = state.copyWith(presentation: value);
  }

  void dosisUnitChanged(MedicineDosisUnit value) {
    state = state.copyWith(
      dosisUnit: value,
    );
  }

  void startDateChanged(DateTime value) {
    state = state.copyWith(startDate: value);
  }

  void endDateChanged(DateTime value) {
    state = state.copyWith(endDate: value);
  }

  void stockChanged(String value) {
    final stock = NotNegativeIntNumber.dirty(value);
    state = state.copyWith(stock: stock);
  }

  void stockWarningChanged(String value) {
    final stockWarning = NotNegativeIntNumber.dirty(value);
    state = state.copyWith(stockWarning: stockWarning);
  }

  void dosisChanged(String value) {
    final dosis = NotNegativeIntNumber.dirty(value);
    state = state.copyWith(dosis: dosis);
  }

  void frecuencyChanged(MedicineFrecuency value) {
    state = state.copyWith(frecuency: value);
  }

  void daysChanged(MedicineDay value) {
    final days = state.days.contains(value)
        ? state.days.where((element) => element != value).toList()
        : [...state.days, value];

    state = state.copyWith(days: days);
  }

  void hoursChanged(List<TimeOfDay> value) {
    state = state.copyWith(hours: value);
  }

  void frecuencyValueChanged(int? value) {
    state = state.copyWith(frecuencyValue: value!);
  }

  void instructionsChanged(String value) {
    final instructions = Instructions.dirty(value);
    state = state.copyWith(instructions: instructions);
  }

  void save() {
    late final Medicine medicine;

    switch (state.frecuency) {
      case MedicineFrecuency.regular:
        medicine = Medicine(
          id: 0,
          name: state.name.value,
          presentation: state.presentation,
          dosisUnit: state.dosisUnit,
          startDate: state.startDate ?? DateTime.now(),
          endDate: state.endDate ?? DateTime.now(),
          stock: int.tryParse(state.stock.value),
          stockWarning: int.tryParse(state.stockWarning.value),
          dosis: double.tryParse(state.dosis.value) ?? 0.0,
          hours: state.hours,
          interval: state.frecuencyValue,
          instructions: state.instructions.value,
        );
        break;
      case MedicineFrecuency.specificDays:
        medicine = Medicine(
          id: 0,
          name: state.name.value,
          presentation: state.presentation,
          dosisUnit: state.dosisUnit,
          startDate: state.startDate ?? DateTime.now(),
          endDate: state.endDate ?? DateTime.now(),
          stock: int.tryParse(state.stock.value),
          stockWarning: int.tryParse(state.stockWarning.value),
          dosis: double.tryParse(state.dosis.value) ?? 0.0,
          days: state.days,
          hours: state.hours,
          instructions: state.instructions.value,
        );
        break;
      case MedicineFrecuency.asNeeded:
        medicine = Medicine(
          id: 0,
          name: state.name.value,
          presentation: state.presentation,
          dosisUnit: state.dosisUnit,
          startDate: state.startDate ?? DateTime.now(),
          endDate: state.endDate ?? DateTime.now(),
          stock: int.tryParse(state.stock.value),
          stockWarning: int.tryParse(state.stockWarning.value),
          dosis: double.tryParse(state.dosis.value) ?? 0.0,
          instructions: state.instructions.value,
        );
        break;
    }

    ref.read(medicineControllerProvider.notifier).addMedicine(medicine);
  }
}
