import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validators/validators.dart';

part 'phone_form_state.freezed.dart';

@freezed
class PhoneFormState with _$PhoneFormState {
  const factory PhoneFormState({
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    @Default(CountryCode.AR) CountryCode countryCode,
  }) = _PhoneFormState;
}
