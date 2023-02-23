import 'package:bloc/bloc.dart';
import 'package:calendar/calendar.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'measurement_form_cubit.freezed.dart';
part 'measurement_form_state.dart';

class MeasurementFormCubit extends Cubit<MeasurementFormState> {
  MeasurementFormCubit({required MeasurementRepository repository})
      : _repository = repository,
        super(const MeasurementFormState());

  final MeasurementRepository _repository;

  void typeChanged(MeasurementType type) {
    emit(state.copyWith(type: type));
  }

  void valueChanged(String value) {
    final valueInt = NotNegativeIntNumber.dirty(value);

    emit(
      state.copyWith(
        value: valueInt,
        status: Formz.validate([valueInt]),
      ),
    );
  }

  void dateChanged(DateTime date) {
    emit(state.copyWith(date: date));
  }

  Future<void> submit() async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final measurement = Measurement(
      date: state.date!,
      type: state.type.toString(),
      value: double.parse(state.value.value),
      id: 0,
    );

    final possibleFailureOrUnit = await _repository.addMeasurement(measurement);

    possibleFailureOrUnit.fold(
      (failure) => emit(state.copyWith(failure: failure)),
      (unit) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
    );
  }
}
