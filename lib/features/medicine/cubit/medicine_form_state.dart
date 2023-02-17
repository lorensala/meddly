part of 'medicine_form_cubit.dart';

@freezed
class MedicineFormState with _$MedicineFormState {
  const factory MedicineFormState({
    @Default(Name.pure()) Name name,
    @Default(Instructions.pure()) Instructions instructions,
    @Default(MedicinePresentation.capusle) MedicinePresentation presentation,
    @Default(MedicineDosisUnit.mg) MedicineDosisUnit dosisUnit,
    DateTime? startDate,
    DateTime? endDate,
    @Default(NotNegativeIntNumber.pure()) NotNegativeIntNumber stock,
    @Default(NotNegativeIntNumber.pure()) NotNegativeIntNumber stockWarning,
    @Default(NotNegativeIntNumber.pure()) NotNegativeIntNumber dosis,
    @Default(MedicineFrecuency.regular) MedicineFrecuency frecuency,
    @Default([MedicineDay.monday]) List<MedicineDay> days,
    @Default([]) List<TimeOfDay> hours,
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(1) int frecuencyValue,
    MedicineFailure? failure,
  }) = _Initial;

  const MedicineFormState._();

  bool get isFrecuencyValid {
    switch (frecuency) {
      case MedicineFrecuency.regular:
        return frecuencyValue > 0;
      case MedicineFrecuency.specificDays:
        return days.isNotEmpty;
      case MedicineFrecuency.asNeeded:
        return true;
    }
  }
}
