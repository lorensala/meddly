import 'package:formz/formz.dart';

enum NotesValidationError { invalid }

class Notes extends FormzInput<String?, NotesValidationError> {
  const Notes.pure() : super.pure('');
  const Notes.dirty([super.value = '']) : super.dirty();

  @override
  NotesValidationError? validator(String? value) {
    if (value != null && value.length > 200) {
      return NotesValidationError.invalid;
    }
    return null;
  }
}
