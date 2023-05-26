import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_number.freezed.dart';

class PhoneNumber extends FormzInput<String, PhoneNumberError> {
  const PhoneNumber.pure() : super.pure('');

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

@freezed
class PhoneNumberError with _$PhoneNumberError {
  const factory PhoneNumberError.invalid() = _Invalid;

  const factory PhoneNumberError.tooShort() = _TooShort;

  const factory PhoneNumberError.tooLong() = _TooLong;

  const factory PhoneNumberError.notNumeric() = _NotNumeric;

  const factory PhoneNumberError.empty() = _Empty;
}
