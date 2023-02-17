import 'package:bloc/bloc.dart';
import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meddly/core/core.dart';
import 'package:validators/validators.dart';

part 'medicine_form_cubit.freezed.dart';
part 'medicine_form_state.dart';

class MedicineFormCubit extends Cubit<MedicineFormState> {
  MedicineFormCubit({required MedicineRepository medicineRepository})
      : _repository = medicineRepository,
        super(const MedicineFormState());

  final MedicineRepository _repository;

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
      ),
    );
  }

  void presentationChanged(MedicinePresentation value) {
    emit(
      state.copyWith(
        presentation: value,
      ),
    );
  }

  void dosisUnitChanged(MedicineDosisUnit value) {
    emit(
      state.copyWith(
        dosisUnit: value,
      ),
    );
  }

  void startDateChanged(DateTime value) {
    emit(
      state.copyWith(
        startDate: value,
      ),
    );
  }

  void endDateChanged(DateTime value) {
    emit(
      state.copyWith(
        endDate: value,
      ),
    );
  }

  void stockChanged(String value) {
    final stock = NotNegativeIntNumber.dirty(value);
    emit(
      state.copyWith(
        stock: stock,
      ),
    );
  }

  void stockWarningChanged(String value) {
    final stockWarning = NotNegativeIntNumber.dirty(value);
    emit(
      state.copyWith(
        stockWarning: stockWarning,
      ),
    );
  }

  void dosisChanged(String value) {
    final dosis = NotNegativeIntNumber.dirty(value);
    emit(
      state.copyWith(
        dosis: dosis,
      ),
    );
  }

  void frecuencyChanged(MedicineFrecuency value) {
    emit(
      state.copyWith(
        frecuency: value,
      ),
    );
  }

  void daysChanged(MedicineDay value) {
    final days = state.days.contains(value)
        ? state.days.where((element) => element != value).toList()
        : [...state.days, value];

    emit(
      state.copyWith(
        days: days,
      ),
    );
  }

  void hoursChanged(List<TimeOfDay> value) {
    emit(
      state.copyWith(
        hours: value,
      ),
    );
  }

  void frecuencyValueChanged(int? value) {
    emit(
      state.copyWith(
        frecuencyValue: value!,
      ),
    );
  }

  void instructionsChanged(String value) {
    final instructions = Instructions.dirty(value);
    emit(
      state.copyWith(
        instructions: instructions,
      ),
    );
  }

  Future<void> submit() async {
    // if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final medicine = Medicine(
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
      hours: state.hours.map((time) => time.toDateTime()).toList(),
      interval: state.frecuencyValue,
      instructions: state.instructions.value,
    );

    final possibleFailureOrUnit = await _repository.addMedicine(medicine);

    possibleFailureOrUnit.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: failure,
        ),
      ),
      (unit) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
    );
  }
}
