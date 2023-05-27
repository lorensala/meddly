import 'package:formz/formz.dart';

enum NotNegativeIntNumberError {
  invalid,
}

class NotNegativeIntNumber
    extends FormzInput<String, NotNegativeIntNumberError> {
  const NotNegativeIntNumber.pure() : super.pure('');

  const NotNegativeIntNumber.dirty([super.value = '']) : super.dirty();

  @override
  NotNegativeIntNumberError? validator(String value) {
    if (value.isEmpty) {
      return null;
    }

    if (int.tryParse(value) == null) {
      return NotNegativeIntNumberError.invalid;
    }

    if (int.parse(value) < 0) {
      return NotNegativeIntNumberError.invalid;
    }

    return null;
  }
}
