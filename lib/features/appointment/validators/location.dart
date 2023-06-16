import 'package:formz/formz.dart';

enum LocationValidationError { invalid }

class Location extends FormzInput<String?, LocationValidationError> {
  const Location.pure() : super.pure('');
  const Location.dirty([super.value = '']) : super.dirty();

  @override
  LocationValidationError? validator(String? value) {
    return null;
  }
}
