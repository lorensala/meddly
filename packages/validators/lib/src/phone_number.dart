import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_number.freezed.dart';

/// {@template phone_number}
/// Phone number input.
/// {@endtemplate}
class PhoneNumber extends FormzInput<String, PhoneNumberError> {
  const PhoneNumber.pure() : super.pure('');

  /// {@macro phone_number}
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  @override
  PhoneNumberError? validator(String value) {
    if (value.isEmpty) return const PhoneNumberError.empty();
    if (value.length < 9) return const PhoneNumberError.tooShort();
    if (value.length > 10) return const PhoneNumberError.tooLong();
    if (int.tryParse(value) == null) return const PhoneNumberError.notNumeric();
    return null;
  }
}

/// {@template phone_number_error}
/// Phone number error.
/// {@endtemplate}
@freezed
class PhoneNumberError with _$PhoneNumberError {
  /// {@macro phone_number_error}
  const factory PhoneNumberError.invalid() = _Invalid;

  /// {@macro phone_number_error}
  const factory PhoneNumberError.tooShort() = _TooShort;

  /// {@macro phone_number_error}
  const factory PhoneNumberError.tooLong() = _TooLong;

  /// {@macro phone_number_error}
  const factory PhoneNumberError.notNumeric() = _NotNumeric;

  /// {@macro phone_number_error}
  const factory PhoneNumberError.empty() = _Empty;
}
