import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email.freezed.dart';

class Email extends FormzInput<String, EmailError> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _regExp =
      RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  @override
  EmailError? validator(String value) {
    if (value.isEmpty) {
      return const EmailError.empty();
    }

    if (!_regExp.hasMatch(value)) {
      return const EmailError.invalid();
    }

    return null;
  }
}

@freezed
class EmailError with _$EmailError {
  const factory EmailError.invalid() = InvalidEmailError;

  const factory EmailError.empty() = EmptyEmailError;
}
