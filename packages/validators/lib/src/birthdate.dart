import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'birthdate.freezed.dart';

class Birthdate extends FormzInput<String, BirthdateError> {
  const Birthdate.pure() : super.pure('');

  const Birthdate.dirty([super.value = '']) : super.dirty();

  static bool _isUnderage(DateTime birthdate) {
    return birthdate
        .isAfter(DateTime.now().subtract(const Duration(days: 365 * 18)));
  }

  static bool _isInvalid(DateTime birthdate) {
    return birthdate.isAfter(DateTime.now());
  }

  @override
  BirthdateError? validator(String value) {
    if (value.isEmpty) return const BirthdateError.empty();

    final date = DateTime.tryParse(value);
    if (date == null) return const BirthdateError.invalid();
    if (_isInvalid(date)) return const BirthdateError.invalid();
    if (_isUnderage(date)) {
      return const BirthdateError.underage();
    }
    return null;
  }
}

@freezed
class BirthdateError with _$BirthdateError {
  const factory BirthdateError.invalid() = _Invalid;

  const factory BirthdateError.empty() = _Empty;

  const factory BirthdateError.underage() = _Underage;
}
