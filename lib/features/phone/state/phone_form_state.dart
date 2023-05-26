import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'phone_form_state.freezed.dart';

@freezed
class PhoneFormState with _$PhoneFormState, FormzMixin {
  const factory PhoneFormState({
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    @Default(CountryCode.AR) CountryCode countryCode,
  }) = _PhoneFormState;

  const PhoneFormState._();

  @override
  // ignore: strict_raw_type
  List<FormzInput> get inputs => [phoneNumber];
}
