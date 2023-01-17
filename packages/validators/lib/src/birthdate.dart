import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'birthdate.freezed.dart';

/// {@template birthdate}
/// Birthdate input.
/// {@endtemplate}
class Birthdate extends FormzInput<String, BirthdateError> {
  const Birthdate.pure() : super.pure('');

  /// {@macro birthdate}
  const Birthdate.dirty([super.value = '']) : super.dirty();

  static bool _isUnderage(DateTime birthdate) {
    return birthdate
        .isBefore(DateTime.now().subtract(const Duration(days: 657)));
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

/// {@template birthdate_error}
/// Birthdate error.
/// {@endtemplate}
@freezed
class BirthdateError with _$BirthdateError {
  /// {@macro birthdate_error}
  const factory BirthdateError.invalid() = _Invalid;

  /// {@macro birthdate_error}
  const factory BirthdateError.empty() = _Empty;

  /// {@macro birthdate_error}
  const factory BirthdateError.underage() = _Underage;
}
