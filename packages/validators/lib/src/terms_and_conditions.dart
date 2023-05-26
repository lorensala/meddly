import 'package:formz/formz.dart';

enum TermsAndConditionsError { invalid }

class TermsAndConditions extends FormzInput<bool, TermsAndConditionsError> {
  const TermsAndConditions.pure() : super.pure(false);

  const TermsAndConditions.dirty({required bool value}) : super.dirty(value);

  @override
  TermsAndConditionsError? validator(bool value) {
    return value ? null : TermsAndConditionsError.invalid;
  }
}
