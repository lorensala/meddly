import 'package:formz/formz.dart';

enum AppointmentDateValidationError { invalid }

class AppointmentDate
    extends FormzInput<DateTime?, AppointmentDateValidationError> {
  const AppointmentDate.pure() : super.pure(null);
  const AppointmentDate.dirty([super.value]) : super.dirty();

  @override
  AppointmentDateValidationError? validator(DateTime? value) {
    if (value == null) return AppointmentDateValidationError.invalid;

    return null;
  }
}
