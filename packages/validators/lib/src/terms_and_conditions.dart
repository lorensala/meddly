import 'package:formz/formz.dart';

/// {@template terms_and_conditions_error}
/// Form input validation error for terms and conditions.
/// {@endtemplate}
enum TermsAndConditionsError {
  /// {@macro terms_and_conditions_error}
  invalid
}

/// {@template terms_and_conditions}
/// Checkbox for terms and conditions.
/// {@endtemplate}
class TermsAndConditions extends FormzInput<bool, TermsAndConditionsError> {
  const TermsAndConditions.pure() : super.pure(false);

  /// {@macro terms_and_conditions}
  const TermsAndConditions.dirty({required bool value}) : super.dirty(value);

  @override
  TermsAndConditionsError? validator(bool value) {
    return value ? null : TermsAndConditionsError.invalid;
  }
}
