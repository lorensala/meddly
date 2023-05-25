import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password.freezed.dart';

/// {@template password}
/// Password input validator with [Formz].
/// {@endtemplate}
class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([super.value = '']) : super.dirty();

  // Minimum eight characters, at least one letter, one number and one special
  // character:
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

/// {@template password_error}
/// Password input error.
/// {@endtemplate}
@freezed
class PasswordError with _$PasswordError {
  /// {@macro password_error}
  const factory PasswordError.invalid() = InvalidPasswordError;

  /// {@macro password_error}
  const factory PasswordError.empty() = EmptyPasswordError;

  /// {@macro password_error}
  const factory PasswordError.tooShort() = TooShortPasswordError;
}
