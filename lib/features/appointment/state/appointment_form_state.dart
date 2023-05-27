// ignore_for_file: strict_raw_type

import 'package:appointment/appointment.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'appointment_form_state.freezed.dart';

@freezed
class AppointmentFormState with _$AppointmentFormState, FormzMixin {
  const factory AppointmentFormState({
    @Default(Name.pure()) Name name,
    @Default(AppointmentSpeciality.cardiology) AppointmentSpeciality speciality,
    DateTime? date,
    @Default(Name.pure()) Name doctor,
    @Default('') String location,
    @Default('') String notes,
  }) = _AppointmentFormState;

  const AppointmentFormState._();

  @override
  List<FormzInput> get inputs => [name, doctor];
}
