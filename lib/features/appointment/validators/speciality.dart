import 'package:appointment/appointment.dart';
import 'package:formz/formz.dart';

enum SpecialtyValidationError { invalid }

class Specialty
    extends FormzInput<AppointmentSpeciality?, SpecialtyValidationError> {
  const Specialty.pure() : super.pure(AppointmentSpeciality.cardiology);
  const Specialty.dirty([super.value = AppointmentSpeciality.cardiology])
      : super.dirty();

  @override
  SpecialtyValidationError? validator(AppointmentSpeciality? value) {
    if (value == null) return SpecialtyValidationError.invalid;
    return null;
  }
}
