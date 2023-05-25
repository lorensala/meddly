import 'package:formz/formz.dart';

/// {@template positive_int_number_error}
/// Positive int number input error.
/// {@endtemplate}
enum NotNegativeIntNumberError {
  /// {@macro positive_int_number_error}
  invalid,
}

/// {@template positive_int_number}
/// Input for positive int number.
/// {@endtemplate}
class NotNegativeIntNumber
    extends FormzInput<String, NotNegativeIntNumberError> {
  const NotNegativeIntNumber.pure() : super.pure('');

  /// {@macro positive_int_number}
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
