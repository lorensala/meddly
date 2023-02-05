import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medicine/medicine.dart';
import 'package:validators/validators.dart';

part 'medicine_form_cubit.freezed.dart';
part 'medicine_form_state.dart';

class MedicineFormCubit extends Cubit<MedicineFormState> {
  MedicineFormCubit() : super(const MedicineFormState());

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

  void hoursChanged(List<DateTime> value) {
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

  void submit() {}
}
