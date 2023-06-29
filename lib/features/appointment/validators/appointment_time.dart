import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum AppointmentTimeValidationError { invalid }

class AppointmentTime
    extends FormzInput<TimeOfDay?, AppointmentTimeValidationError> {
  const AppointmentTime.pure() : super.pure(null);
  const AppointmentTime.dirty([super.value]) : super.dirty();

  @override
  AppointmentTimeValidationError? validator(TimeOfDay? value) {
    if (value == null) return AppointmentTimeValidationError.invalid;

    return null;
  }
}
