import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password.freezed.dart';

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&.(),-_])[A-Za-z\d@$!%*#?&.(),-_]{8,}',
  );

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty) {
      return const PasswordError.empty();
    }

    if (value.length < 8) {
      return const PasswordError.tooShort();
    }

    if (!_passwordRegExp.hasMatch(value)) {
      return const PasswordError.invalid();
    }

    return null;
  }
}

@freezed
class PasswordError with _$PasswordError {
  const factory PasswordError.invalid() = InvalidPasswordError;

  const factory PasswordError.empty() = EmptyPasswordError;

  const factory PasswordError.tooShort() = TooShortPasswordError;
}
