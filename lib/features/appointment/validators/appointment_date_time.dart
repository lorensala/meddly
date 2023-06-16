import 'package:formz/formz.dart';

enum AppointmentDateTimeValidationError { invalid }

class AppointmentDateTime
    extends FormzInput<DateTime?, AppointmentDateTimeValidationError> {
  const AppointmentDateTime.pure() : super.pure(null);
  const AppointmentDateTime.dirty([super.value]) : super.dirty();

  @override
  AppointmentDateTimeValidationError? validator(DateTime? value) {
    if (value == null) return null;

    // if (value.isBefore(DateTime.now())) {
    //   return AppointmentDateTimeValidationError.invalid;
    // }

    return null;
  }
}
