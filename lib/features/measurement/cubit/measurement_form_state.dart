part of 'measurement_form_cubit.dart';

@freezed
class MeasurementFormState with _$MeasurementFormState {
  const factory MeasurementFormState({
    @Default(MeasurementType.bloodGlucose) MeasurementType type,
    @Default(NotNegativeIntNumber.pure()) NotNegativeIntNumber value,
    DateTime? date,
    @Default(FormzStatus.pure) FormzStatus status,
    MeasurementFailure? failure,
  }) = _Initial;
}
