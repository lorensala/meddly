// ignore_for_file: strict_raw_type

import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meddly/features/appointment/appointment.dart';
import 'package:validators/validators.dart';

part 'appointment_form_state.freezed.dart';

@freezed
class AppointmentFormState with _$AppointmentFormState, FormzMixin {
  const factory AppointmentFormState({
    @Default(0) int id,
    @Default(Name.pure()) Name name,
    @Default(Specialty.pure()) Specialty speciality,
    @Default(AppointmentDateTime.pure()) AppointmentDateTime dateTime,
    @Default(Doctor.pure()) Doctor doctor,
    @Default(Location.pure()) Location location,
    @Default(Notes.pure()) Notes notes,
    @Default(true) bool isEditing,
  }) = _AppointmentFormState;

  const AppointmentFormState._();

  @override
  List<FormzInput> get inputs => [
        name,
        doctor,
        speciality,
        location,
        notes,
        dateTime,
      ];
}
